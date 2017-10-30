require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :title => "Title",
        :text => "MyText",
        :lang_from => "Lang From",
        :lang_to => "Lang To",
        :user_id => nil
      ),
      Question.create!(
        :title => "Title",
        :text => "MyText",
        :lang_from => "Lang From",
        :lang_to => "Lang To",
        :user_id => nil
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Lang From".to_s, :count => 2
    assert_select "tr>td", :text => "Lang To".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
