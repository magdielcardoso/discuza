class FavoriteDiscussion < ApplicationRecord
  belongs_to :user
  belongs_to :discussion

  validates :user_id, uniqueness: { scope: :discussion_id }
end
