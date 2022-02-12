# frozen_string_literal: true


SORT_OPTIONS =
  {
    newest_first: {name: "Newest First", query: 'created_at DESC'},
    popular_first: {name: "Popular First", query: 'created_at'},
    price_low_to_high: {name: "Price Low to High", query: 'price'},
    price_high_to_low: {name: "Price High to Low", query: 'price DESC'},
    title_a_z: {name: "Title: A to Z", query: 'title'},
    title_z_a: {name: "Title: Z to A", query: 'title DESC'}
  }.freeze

