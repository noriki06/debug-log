require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        user_id: 2,
        content: "Content"
      ),
      Article.create!(
        user_id: 2,
        content: "Content"
      )
    ])
  end

  it "renders a list of articles" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Content".to_s), count: 2
  end
end
