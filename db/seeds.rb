# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Author.delete_all
Review.delete_all
Book.delete_all
Category.delete_all


10.times do
  User.create!(email: FFaker::Internet.safe_email,
               password: "#{rand(10..99)}TesT#{rand(10..99)}",
               name: FFaker::Name.name,
               avatar: FFaker::Avatar.image)
end

user = User.last
users = User.all


%w[Fantasy Novel Detective Science].each do |cat|
  Category.create(name: cat)
end

categories = Category.all

50.times do
  Author.create(first_name: FFaker::Name.first_name,
                last_name: FFaker::Name.last_name,
                description: FFaker::Lorem.paragraph)
end
authors = Author.all

def book_authors(authors)
  selected_authors = []
  rand(1..3).times do
    author=authors.sample
    selected_authors << author unless selected_authors.include?(author)
  end
  selected_authors
end

used_book_titles = []

300.times do |index|
  title = FFaker::Book.title
  used_book_titles.include?(title) ? title << "#{index}": used_book_titles << title
  Book.create(title: title,
              price: [5.99,10.99,15.99,20.99,35.99,99.99].sample,
              description: FFaker::Lorem.paragraphs.join('. ')+ FFaker::Lorem.paragraphs.join('. '),
              height: rand(7.5..10.0).floor(2),
              width: rand(4.5..5.5).floor(2),
              depth: rand(0.3..4.0).floor(2),
              year_of_publication: rand(1991..2021),
              materials: FFaker::Lorem.words.join(', '),
              category_id: categories.sample.id )
end


books = Book.all


books.each do |book|
  book_authors(authors).each do |author|
    Authorship.create!(author_id: author.id, book_id: book.id)
  end
  rand(1..4).times do
    user = User.last
    Review.create!(title:FFaker::Lorem.words.join(', '),
                   text:FFaker::Lorem.sentences.join('. '),
                   rating: rand(1..5),
                   book_id: book.id,
                   user_id: user.sample.id)
  end
end


