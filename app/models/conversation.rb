class Conversation < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  has_many :messages, dependent: :destroy

  # validates :user1, uniqueness: { scope: :user2, :message => "conversation already exists." }
	# validates :user2, uniqueness: { scope: :user1, :message => "conversation already exists." }
	validates_uniqueness_of :user1_id, :scope => :user2_id

  private
  
  def start_must_be_before_end_time
      errors.add(:start_time, "must be before end time") unless
          start_time < end_time
  end
  

	scope :between, -> (user1_id, user2_id) do
		where("(conversations.user1_id = ? AND conversations.user2_id =?) OR (conversations.user1_id = ? AND conversations.user2_id =?)", user1_id,user2_id, user2_id, user1_id)
	end
  
end
