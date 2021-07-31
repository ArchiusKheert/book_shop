FactoryBot.define do
  factory :book do
    title {FFaker::Book.title}
    price {[5.99,10.99,15.99,20.99,35.99,99.99].sample}
    description {FFaker::Book.description}
    height { "9.99" }
    width { "9.99" }
    depth { "9.99" }
    year_of_publication {FFaker::Vehicle.year}
    materials {FFaker::Lorem.words.join(', ')}
    authors {[]}
    reviews {[]}
  end
end
