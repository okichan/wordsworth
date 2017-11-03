require 'rails_helper'

RSpec.describe "conversations/new", type: :view do
  before(:each) do
    assign(:conversation, Conversation.new(
      :user1 => nil,
      :user2 => nil
    ))
  end

  it "renders new conversation form" do
    render

    assert_select "form[action=?][method=?]", conversations_path, "post" do

      assert_select "input[name=?]", "conversation[user1_id]"

      assert_select "input[name=?]", "conversation[user2_id]"
    end
  end
end
