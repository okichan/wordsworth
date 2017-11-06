class Conversation < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  has_many :messages, dependent: :destroy

  # validates :user1, uniqueness: { scope: :user2, :message => "conversation already exists." }
	# validates :user2, uniqueness: { scope: :user1, :message => "conversation already exists." }
	validates_uniqueness_of :user1_id, :scope => :user2_id

  # scope :between, -> (user1_id, user2_id) do
	# 	where("(conversations.user1_id = ? AND conversations.user2_id =?) OR (conversations.user1_id = ? AND conversations.user2_id =?)", user1_id,user2_id, user2_id, user1_id)
	# end

  # before_save :order_users

  # private
  #   def order_users
  #     sorted_ids = [user1_id, user2_id].sort
  #     user1_id = sorted_ids.first
  #     user2_id = sorted_ids.second
  #   end
  
end
