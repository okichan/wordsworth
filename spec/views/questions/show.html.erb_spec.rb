require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :title => "Title",
      :text => "MyText",
      :lang_from => "Lang From",
      :lang_to => "Lang To",
      :user_id => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Lang From/)
    expect(rendered).to match(/Lang To/)
    expect(rendered).to match(//)
  end
end
