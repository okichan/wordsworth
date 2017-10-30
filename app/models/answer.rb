class Answer < ApplicationRecord
  belongs_to :user_id
  belongs_to :question_id
end
