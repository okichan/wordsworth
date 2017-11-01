class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :text, presence: true
end
