require 'rails_helper'

RSpec.describe "conversations/index", type: :view do
  before(:each) do
    assign(:conversations, [
      Conversation.create!(
        :user1 => nil,
        :user2 => nil
      ),
      Conversation.create!(
        :user1 => nil,
        :user2 => nil
      )
    ])
  end

  it "renders a list of conversations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
