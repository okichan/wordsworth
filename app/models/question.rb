class Question < ApplicationRecord
  belongs_to :user_id
  has_many :answers
end
