module SortOptions
  def self.sort_options
    {
      newest_first: {name: "Newest First", option: 'created_at DESC'},
      popular_first: {name: "Popular First", option: 'created_at'},
      price_low_to_high: {name: "Price Low to High", option: 'price'},
      price_high_to_low: {name: "Price High to Low", option: 'price DESC'},
      title_a_z: {name: "Title: A to Z", option: 'title'},
      title_z_a: {name: "Title: Z to A", option: 'title DESC'}
    }
  end
end