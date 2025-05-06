class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactable, polymorphic: true

  validates :emoji, presence: true
  # Garantir que um usuário só possa ter uma reação do mesmo tipo por item
  validates :user_id, uniqueness: { scope: [:reactable_id, :reactable_type, :emoji], message: "can only react once with the same emoji per item" }
end
