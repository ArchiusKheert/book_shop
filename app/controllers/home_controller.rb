class HomeController < ApplicationController
  def index
    @categories = Category.all
    @bestsellers = Book.last(4)
  end
end
