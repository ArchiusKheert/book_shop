json.extract! book, :id, :title, :price, :quantity, :description, :height, :width, :depth, :year_of_publication, :materials, :created_at, :updated_at
json.url book_url(book, format: :json)
