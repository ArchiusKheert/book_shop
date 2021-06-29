# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: FFaker::Internet.safe_email,
              password: "P1-#{FFaker::Internet.password}",
              name: FFaker::Name.name,
              image: FFaker::Avatar.image)

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
30.times do
  Book.create(title: FFaker::Book.title,
              price: [5.99,10.99,15.99,20.99,35.99,99.99].sample,
              quantity: 1,
              description: FFaker::Book.description,
              height: [3.50,7.9,4.6,6.2].sample,
              width: [3.12,4.5,2.9,3.6].sample,
              depth: [0.9,0.8,0.7].sample,
              year_of_publication: (1984..2021).to_a_sample,
              materials: FFaker::HipsterIpsum.words,
              authors: [authors.sample, authors.sample],
              categories: [categories.sample])
end


book = Book.first


5.times do
  Review.create(title: FFaker::HipsterIpsum.words,
                text: FFaker::HipsterIpsum.sentences,
                rating: (1..5).to_a_sample,
                book_id: book.id,
                user_id: user.id)
end


