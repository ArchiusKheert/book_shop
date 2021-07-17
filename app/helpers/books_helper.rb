module BooksHelper
  def book_short_description(book, size =50)
    return book.description if book.description.length <= 50
    book.description.slice(0,size-3).concat('...')
  end

  def book_authors(book)
    book.authors.map { |aut| "#{aut.first_name} #{aut.last_name}" }.join(', ')
  end

  def book_dimensions(book)
    "H: #{book.height}\" x W: #{book.width}\" x D: #{book.depth}\""
  end
end
