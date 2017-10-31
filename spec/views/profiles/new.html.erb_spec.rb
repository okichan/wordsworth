require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :bio => "MyText",
      :user_id => nil,
      :image_data => "MyString"
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "textarea[name=?]", "profile[bio]"

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[image_data]"
    end
  end
end
