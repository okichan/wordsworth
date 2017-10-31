require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :bio => "MyText",
      :user_id => nil,
      :image_data => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "textarea[name=?]", "profile[bio]"

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[image_data]"
    end
  end
end
