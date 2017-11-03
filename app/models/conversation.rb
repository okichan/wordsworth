class Conversation < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  validates_uniqueness_of :user1_id, :scope => :user2_id

  scope :between, -> (user1_id, user2_id) do
    where("(conversations.user1_id = ? AND conversations.user2_id =?) OR (conversations.user1_id = ? AND conversations.user2_id =?)", user1_id, user2_id, user2_id, user1_id)
  end
  
end
