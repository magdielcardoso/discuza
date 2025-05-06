class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :value, inclusion: { in: [-1, 1], message: "%<value>s is not a valid vote value" }
  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type], message: "can only vote once per item" }
end
