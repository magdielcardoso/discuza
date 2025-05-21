class Category < ApplicationRecord
  has_many :discussions, dependent: :nullify
end
