require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :bio => "MyText",
        :user_id => nil,
        :avatar => "Avatar"
      ),
      Profile.create!(
        :bio => "MyText",
        :user_id => nil,
        :avatar => "Avatar"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
  end
end
