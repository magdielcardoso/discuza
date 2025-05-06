class Reply < ApplicationRecord
  belongs_to :discussion
  belongs_to :user
  has_rich_text :content

  has_many :votes, as: :votable, dependent: :destroy
  has_many :reactions, as: :reactable, dependent: :destroy
  has_many :answer_marks, dependent: :destroy

  validates :content, presence: true

  # Define default value for boolean
  attribute :marked_as_answer, :boolean, default: false

  scope :marked_as_answer, -> { where(marked_as_answer: true) }
end
