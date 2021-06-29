require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        title: "Title",
        price: "9.99",
        quantity: 2,
        description: "MyText",
        height: "9.99",
        width: "9.99",
        depth: "9.99",
        year_of_publication: 3,
        materials: "Materials"
      ),
      Book.create!(
        title: "Title",
        price: "9.99",
        quantity: 2,
        description: "MyText",
        height: "9.99",
        width: "9.99",
        depth: "9.99",
        year_of_publication: 3,
        materials: "Materials"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Materials".to_s, count: 2
  end
end
