class HomeController < ApplicationController
  def index
    @latest_books = Book.last(3)
    @categories = Category.all
    @bestsellers = @categories.map {|category| category.books.first}
  end
end
