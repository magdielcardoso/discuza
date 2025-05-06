class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Adiciona anexo do avatar
  has_one_attached :avatar

  has_many :discussions, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :answer_marks, dependent: :destroy

  validates :name, presence: true
end
