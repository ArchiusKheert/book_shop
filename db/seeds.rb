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
Delivery.delete_all

avatar_colors = %w[grey blue green orange pink]

10.times do
  User.create!(email: FFaker::Internet.safe_email,
               password: "#{rand(10..99)}TesT#{rand(10..99)}",
               name: FFaker::Name.name,
               remove_avatar_url: "https://s3.eu-central-1.amazonaws.com/stas7t-bookstore/avatars/default_avatar_#{avatar_colors.sample}.png")
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
              category_id: categories.sample.id,
              remote_cover_url: "https://s3.eu-central-1.amazonaws.com/stas7t-bookstore/covers/Cover_#{rand(1..56).to_s.rjust(4, '0')}.png")
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


Delivery.create(name: 'Delivery next day', time: '3 to 7 days', price: 5.00)
Delivery.create(name: 'Pick up In-Store', time: '5 to 20 days', price: 10.00)
Delivery.create(name: 'Express', time: '2 to 3 days', price: 15.00)





