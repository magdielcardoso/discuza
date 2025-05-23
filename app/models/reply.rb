class Reply < ApplicationRecord
  belongs_to :discussion
  belongs_to :user
  has_rich_text :content

  has_many :votes, as: :votable, dependent: :destroy
  has_many :reactions, as: :reactable, dependent: :destroy
  has_many :answer_marks, dependent: :destroy

  validates :content, presence: true

  # Define default value for boolean
  attribute :ai_generated, :boolean, default: false

  scope :ai_generated, -> { where(ai_generated: true) }
  scope :human_generated, -> { where(ai_generated: false) }
  scope :marked_as_answer, -> { joins(:answer_marks) }

  def ai_generated?
    ai_generated
  end

  def marked_as_answer?
    answer_marks.any?
  end
end
