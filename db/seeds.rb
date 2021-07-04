# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email:FFaker::Internet.safe_email,
             password: 'test1234TEST',
             name:FFaker::Name.name,
             image:FFaker::Avatar.image)

user = User.last

Category.create(name: 'Fantasy')
Category.create(name: 'Novel')
Category.create(name: 'Detective')
Category.create(name: 'Science literature')

categories = Category.all

10.times do
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

def book_categories(categories)
  selected_categories = []
  rand(1..3).times do
    category=categories.sample
    selected_categories << category unless selected_categories.include?(category)
  end
  selected_categories
end

30.times do
  Book.create(title: FFaker::Book.title,
              price: [5.99,10.99,15.99,20.99,35.99,99.99].sample,
              quantity: 1,
              description: FFaker::Book.description,
              height: rand(7.5..10.0).floor(2),
              width: rand(4.5..5.5).floor(2),
              depth: rand(0.3..4.0).floor(2),
              year_of_publication: rand(1991..2021),
              materials: FFaker::Lorem.words.join(', '),
              authors: book_authors(authors),
              categories: book_categories(categories))
end


books = Book.all


books.each do |book|
  rand(1..4).times do
    user = User.last
    Review.create!(title:FFaker::Lorem.words.join(', '),
                   text:FFaker::Lorem.sentences.join('. '),
                   rating: rand(1..5),
                   book_id: book.id,
                   user_id: user.id)
  end
end


