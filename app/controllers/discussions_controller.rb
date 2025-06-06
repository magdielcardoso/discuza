class DiscussionsController < ApplicationController
  include ActionView::RecordIdentifier # Necessário para dom_id se usado no controller

  # Garante que o usuário esteja logado para as ações que precisam de um usuário
  before_action :authenticate_user!, only: [ :index, :new, :create, :edit, :update, :destroy, :reopen, :close, :toggle_pin ]
  before_action :set_discussion, only: %i[ show edit update destroy reopen close toggle_pin ]
  # Garante que apenas o dono possa editar, atualizar, destruir ou reabrir
  before_action :authorize_discussion_owner!, only: %i[ edit update destroy reopen ]
  # Permite que dono ou admin fechem discussões
  before_action :authorize_discussion_close!, only: [ :close ]
  before_action :authorize_admin!, only: [ :toggle_pin ]

  # GET /discussions or /discussions.json
  def index
    if params[:favorites] == "true"
      # Mostra discussões favoritadas pelo usuário atual
      @discussions = current_user.favorited_discussions.includes(:user, :category).order(created_at: :desc)
      @page_title = "Minhas Discussões Favoritas"
      @page_badge_text = "Favoritas"
      @page_badge_color = "bg-yellow-500"
    else
      # Mostra discussões criadas pelo usuário atual
      @discussions = current_user.discussions.includes(:category).order(created_at: :desc)
      @page_title = "Minhas Discussões"
      @page_badge_text = "Minhas"
      @page_badge_color = "bg-lime-500"
    end
  end

  # GET /discussions/1 or /discussions/1.json
  def show
    # Conta o total de respostas ANTES de agrupar/ordenar
    @total_replies_count = @discussion.replies.count

    # Carrega as respostas, incluindo associações necessárias
    # Ordena pela contagem de marcas (desc) e depois pela data de criação (asc)
    @replies = @discussion.replies
                       .left_joins(:answer_marks)
                       .group("replies.id") # Agrupa por ID da resposta
                       .includes(:user, :answer_marks) # Inclui user e as marcas para a view
                       .with_rich_text_content # Inclui conteúdo ActionText
                       .order("COUNT(answer_marks.id) DESC, replies.created_at ASC") # Ordena pela contagem e data

    @reply = @discussion.replies.new # For the new reply form

    # Identifica a ID da resposta com mais marcas (se houver alguma > 0)
    @top_reply = @replies.to_a.first
    @top_reply_id = (@top_reply && @top_reply.answer_marks.size > 0) ? @top_reply.id : nil

    # Prepare data for the reactions partial
    @reaction_counts = @discussion.reactions.group(:emoji).count
    @current_user_reactions = current_user ? current_user.reactions.where(reactable: @discussion).pluck(:emoji) : []
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions or /discussions.json
  def create
    @discussion = current_user.discussions.new(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: "Discussion was successfully created." }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussions/1 or /discussions/1.json
  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: "Discussão atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1 or /discussions/1.json
  def destroy
    @discussion.destroy!

    respond_to do |format|
      format.html { redirect_to discussions_path, status: :see_other, notice: "Discussão excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  # PATCH /discussions/1/reopen
  def reopen
    # Apenas reabre, limpando os campos relacionados ao fechamento
    @discussion.update(closed: false, closed_at: nil, closed_by: nil, closure_status: nil, closure_reason: nil)

    respond_to do |format|
      format.turbo_stream {
        @discussion.reload # Recarrega para garantir estado atualizado no partial
        render turbo_stream: turbo_stream.replace("discussion_top_section", partial: "discussions/top_section", locals: { discussion: @discussion })
      }
      format.html { redirect_to @discussion, notice: "Discussão reaberta." }
    end
  end

  # PATCH /discussions/1/close
  def close
    # Debug: log the parameters being received
    Rails.logger.debug "Close params: #{close_params.inspect}"
    Rails.logger.debug "Full params: #{params.inspect}"

    # Prepare the close parameters
    close_attributes = close_params.merge(closed: true, closed_at: Time.current, closed_by: current_user)

    # Clear closure_reason if status is 'resolved'
    if close_attributes[:closure_status] == "resolved"
      close_attributes[:closure_reason] = nil
    end

    # Fecha a discussão com status e razão
    if @discussion.update(close_attributes)
      respond_to do |format|
        format.turbo_stream {
          @discussion.reload
          render turbo_stream: turbo_stream.replace("discussion_top_section", partial: "discussions/top_section", locals: { discussion: @discussion })
        }
        format.html { redirect_to @discussion, notice: "Discussão fechada." }
      end
    else
      # O que fazer se a validação falhar (ex: não forneceu razão para not_resolved)?
      # Idealmente, a validação ocorreria no modal antes do submit,
      # mas podemos renderizar um alerta ou re-renderizar parte da página com erros.
      # Por simplicidade, redirecionaremos com alerta por enquanto.
      # TODO: Melhorar tratamento de erro (ex: re-renderizar modal com erros via stream)
      redirect_to @discussion, alert: "Erro ao fechar discussão: #{@discussion.errors.full_messages.join(', ')}"
    end
  end

  # PATCH /discussions/:id/toggle_pin
  def toggle_pin
    @discussion.update(pinned: !@discussion.pinned)
    redirect_back fallback_location: root_path, notice: (@discussion.pinned ? "Discuss\u00E3o fixada." : "Discuss\u00E3o desafixada.")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      # Inclui o usuário e quem fechou para evitar N+1
      @discussion = Discussion.includes(:user, :closed_by).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def discussion_params
      params.require(:discussion).permit(:title, :content, :category_id)
    end

    # Novos parâmetros permitidos para fechar
    def close_params
       params.require(:discussion).permit(:closure_status, :closure_reason)
    end

    # Helper de autorização para o dono da discussão
    def authorize_discussion_owner!
      head :forbidden unless @discussion.user == current_user
    end

    # Permite que dono ou admin fechem discussões
    def authorize_discussion_close!
      head :forbidden unless @discussion.user == current_user || current_user&.is_admin?
    end

    # Permite apenas admins para certas ações
    def authorize_admin!
      head :forbidden unless current_user&.is_admin?
    end
end
