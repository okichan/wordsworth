require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :title => "MyString",
      :text => "MyText",
      :lang_from => "MyString",
      :lang_to => "MyString",
      :user_id => nil
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[title]"

      assert_select "textarea[name=?]", "question[text]"

      assert_select "input[name=?]", "question[lang_from]"

      assert_select "input[name=?]", "question[lang_to]"

      assert_select "input[name=?]", "question[user_id]"
    end
  end
end
