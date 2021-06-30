module BooksHelper
  def book_short_description(book, size =50)
    return book.description if book.description.length <= 50
    book.description.slice(0,size-3).concat('...')
  end

  def book_authors
    book.authors.map { |aut| author_name(aut) }.join(', ')
  end
end
