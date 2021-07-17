class HomeController < ApplicationController
  def index
    #@latest_books = Book.last(3)
    @bestsellers = Book.last(4)
  end
end
