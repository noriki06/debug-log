require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  let(:article) {
    Article.create!(
      user_id: 1,
      content: "MyString"
    )
  }

  before(:each) do
    assign(:article, article)
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(article), "post" do

      assert_select "input[name=?]", "article[user_id]"

      assert_select "input[name=?]", "article[content]"
    end
  end
end
