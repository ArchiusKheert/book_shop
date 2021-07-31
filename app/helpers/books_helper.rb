module BooksHelper

  def book_authors(book)
    book.authors.map { |aut| "#{aut.first_name} #{aut.last_name}" }.join(', ')
  end

  def book_dimensions(book)
    "H: #{book.height}\" x W: #{book.width}\" x D: #{book.depth}\""
  end
end
