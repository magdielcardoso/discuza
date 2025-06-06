class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :closed_by, class_name: "User", optional: true
  belongs_to :category
  has_rich_text :content

  has_many :replies, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
  has_many :reactions, as: :reactable, dependent: :destroy

  has_many :favorite_discussions, dependent: :destroy
  has_many :favoriting_users, through: :favorite_discussions, source: :user

  # Enum para status de fechamento com prefixo (Comentado devido a ArgumentError)
  # enum closure_status: { resolved: 'resolved', not_resolved: 'not_resolved' }, _prefix: true

  # Define as constantes manualmente
  CLOSURE_STATUSES = { resolved: "resolved", not_resolved: "not_resolved" }.freeze
  RESOLVED = CLOSURE_STATUSES[:resolved]
  NOT_RESOLVED = CLOSURE_STATUSES[:not_resolved]

  validates :title, presence: true
  validates :content, presence: true
  # Valida a razão usando um método customizado que verifica o valor da string
  validates :closure_reason, presence: true, if: :requires_closure_reason?

  attribute :pinned, :boolean, default: false
  attribute :closed, :boolean, default: false

  # AI Analysis callback - analyze discussion after creation
  after_create :schedule_ai_analysis

  # Search scope for discussions
  scope :search_by_term, ->(term) {
    return all if term.blank?

    sanitized_term = "%#{term.strip}%"
    left_joins(:rich_text_content)
      .joins(:user, :category)
      .where(
        "discussions.title ILIKE :search OR
         action_text_rich_texts.body ILIKE :search OR
         users.name ILIKE :search OR
         categories.name ILIKE :search",
        search: sanitized_term
      )
  }

  # --- Métodos Manuais (Substituindo Enum) ---

  # Verifica se o status é 'resolved'
  def closure_status_resolved?
    closure_status == RESOLVED
  end

  # Verifica se o status é 'not_resolved'
  def closure_status_not_resolved?
    closure_status == NOT_RESOLVED
  end

  private

  # Método para a condição da validação
  def requires_closure_reason?
    # Só exige closure_reason se estiver fechado E o status for 'not_resolved'
    closed? && closure_status == NOT_RESOLVED
  end

  # Schedule AI analysis job for new discussions
  def schedule_ai_analysis
    # Delay the job slightly to ensure transaction is committed
    AnalyzeDiscussionJob.set(wait: 30.seconds).perform_later(id)
  end
end
