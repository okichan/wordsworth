class AddUniqueIndexToConversation < ActiveRecord::Migration[5.1]
  def change
    add_index :conversations, [:user1_id, :user2_id], unique: true
  end
end