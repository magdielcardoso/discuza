class RepliesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_discussion
  before_action :set_reply, only: %i[ show edit update destroy toggle_answer ]
  before_action :authorize_reply_owner!, only: %i[ edit update ]
  before_action :authorize_reply_owner_or_discussion_owner!, only: %i[ destroy ]

  # GET /replies or /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1 or /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @reply = Reply.new
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /discussions/:discussion_id/replies
  def create
    # Criar a resposta associada à discussão e ao usuário logado
    @reply = @discussion.replies.new(reply_params)
    @reply.user = current_user

    respond_to do |format|
      if @reply.save
        format.turbo_stream do
          # Renderiza o Turbo Stream para adicionar a nova resposta à lista
          # e limpar/resetar o formulário
          render turbo_stream: [
            turbo_stream.append("replies_list", partial: "replies/reply", locals: { reply: @reply }),
            turbo_stream.replace(dom_id(@discussion, :new_reply), partial: "replies/form", locals: { discussion: @discussion, reply: Reply.new })
          ]
        end
        format.html { redirect_to discussion_path(@discussion, anchor: dom_id(@reply)), notice: "Resposta publicada com sucesso." } # Fallback HTML
      else
        format.turbo_stream do
          # Re-renderiza o formulário com os erros
          render turbo_stream: turbo_stream.replace(dom_id(@discussion, :new_reply), partial: "replies/form", locals: { discussion: @discussion, reply: @reply }),
                 status: :unprocessable_entity
        end
        format.html { render "discussions/show", status: :unprocessable_entity } # Fallback HTML, renderiza a página show da discussão novamente
      end
    end
  end

  # PATCH/PUT /discussions/:discussion_id/replies/:id
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@reply, partial: "replies/reply", locals: { reply: @reply }) }
        format.html { redirect_to discussion_path(@discussion, anchor: dom_id(@reply)), notice: "Resposta atualizada com sucesso." }
      else
        # Lidar com erros de atualização (ex: re-renderizar um formulário de edição inline, se houver)
        format.html { render :edit, status: :unprocessable_entity } # Placeholder
      end
    end
  end

  # DELETE /discussions/:discussion_id/replies/:id
  def destroy
    @reply.destroy!

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@reply) }
      format.html { redirect_to discussion_path(@discussion), status: :see_other, notice: "Resposta excluída com sucesso." }
    end
  end

  # PATCH /discussions/:discussion_id/replies/:id/toggle_answer
  def toggle_answer
    # Verifica se o usuário LOGADO já marcou esta resposta
    existing_mark = @reply.answer_marks.find_by(user: current_user)

    if existing_mark
      existing_mark.destroy
    else
      # Cria a marca associada ao usuário LOGADO
      @reply.answer_marks.create(user: current_user)
    end

    # Recarrega a resposta com as marcas para o partial
    @reply.reload

    respond_to do |format|
      format.turbo_stream { 
        render turbo_stream: turbo_stream.replace(@reply, partial: "replies/reply", locals: { reply: @reply, discussion: @discussion })
      }
      format.html { redirect_to discussion_path(@discussion, anchor: dom_id(@reply)), notice: "Marcação da resposta atualizada." } # Fallback
    end
  end

  private
    def set_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end

    def set_reply
      # Carrega a resposta, seu conteúdo ActionText e o usuário associado
      @reply = @discussion.replies.includes(:user).with_rich_text_content.find(params[:id])
    end

    # Permitir apenas o conteúdo da resposta (ActionText cuidará disso)
    def reply_params
      params.require(:reply).permit(:content)
    end

    # Helpers de Autorização (Exemplos - podem precisar de refino)
    def authorize_reply_owner!
      head :forbidden unless @reply.user == current_user
    end

    def authorize_reply_owner_or_discussion_owner!
      head :forbidden unless @reply.user == current_user || @discussion.user == current_user
    end

    # Helper de autorização - não mais necessário para toggle_answer, mas mantido para outras ações
    def authorize_discussion_owner!
      head :forbidden unless @discussion.user == current_user
    end
end
