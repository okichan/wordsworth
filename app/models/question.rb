class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :title, presence: true
end
