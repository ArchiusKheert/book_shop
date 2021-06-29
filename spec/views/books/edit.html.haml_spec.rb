require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      title: "MyString",
      price: "9.99",
      quantity: 1,
      description: "MyText",
      height: "9.99",
      width: "9.99",
      depth: "9.99",
      year_of_publication: 1,
      materials: "MyString"
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[price]"

      assert_select "input[name=?]", "book[quantity]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[height]"

      assert_select "input[name=?]", "book[width]"

      assert_select "input[name=?]", "book[depth]"

      assert_select "input[name=?]", "book[year_of_publication]"

      assert_select "input[name=?]", "book[materials]"
    end
  end
end
