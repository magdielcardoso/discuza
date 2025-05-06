class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :closed_by, class_name: 'User', optional: true
  has_rich_text :content

  has_many :replies, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
  has_many :reactions, as: :reactable, dependent: :destroy

  # Enum para status de fechamento com prefixo (Comentado devido a ArgumentError)
  # enum closure_status: { resolved: 'resolved', not_resolved: 'not_resolved' }, _prefix: true

  # Define as constantes manualmente
  CLOSURE_STATUSES = { resolved: 'resolved', not_resolved: 'not_resolved' }.freeze
  RESOLVED = CLOSURE_STATUSES[:resolved]
  NOT_RESOLVED = CLOSURE_STATUSES[:not_resolved]

  validates :title, presence: true
  validates :content, presence: true
  # Valida a razão usando um método customizado que verifica o valor da string
  validates :closure_reason, presence: true, if: :requires_closure_reason?

  attribute :pinned, :boolean, default: false
  attribute :closed, :boolean, default: false

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
    closed? && closure_status_not_resolved?
  end

end
