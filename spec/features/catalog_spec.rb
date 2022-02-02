require 'rails_helper'

Rspec.feature 'Catalog', type: :feature do

  before do
    FactoryBot.create_list(:book, 25)
    @books_a_to_z = Book.order('title')
    @books_z_to_a = Book.order('title DESC')
    @categories = Category.all
    @books_category_last = Book.by_category(@categories.last.id).order('created_at DESC')
  end

  scenario 'Go to Catalog from menu' do
    visit root_path
    within('div.hidden-xs') do
      find('.nav.navbar-nav').click_link('Shop')
      find('ul.dropdown-menu').all('a').first.click
    end
    expect(page.current_path).to eq catalog_path
  end

  scenario 'Change a filter by theme' do
    visit catalog_path
    within('div.hidden-xs.clearfix') do
      find('ul.list-inline').all('a.filter-link').last.click
    end

    within('#books') do
      expect(all('.title').first.text).to eq @books_category_last.first.title
    end
  end

  scenario 'Change an order of displayed items' do
    visit catalog_path
    within('div.hidden-xs.clearfix') do
      find('a.dropdown-toggle.lead.small').click
      find('ul.dropdown-menu').click_link('Title: A to Z')
    end
    expect(page.current_path).to eq catalog_path

    within('#books') do
      expect(all('.title').first.text).to eq @books_a_to_z.first.title
      expect(all('.title')[5].text).to eq @books_a_to_z[5].title
    end

    within('div.hidden-xs.clearfix') do
      find('a.dropdown-toggle.lead.small').click
      find('ul.dropdown-menu').click_link('Title: Z to A')
    end

    expect(page.current_path).to eq catalog_path

    within('#books') do
      expect(all('.title').first.text).to eq @books_z_to_a.first.title
      expect(all('.title')[4].text).to eq @books_z_to_a[4].title
    end
  end

  scenario 'View more books' do
    visit catalog_path

    within('#books') { expect(all('.title').size).to eq 12 }

    find('#paginator').click_link('View More')

    within('#books') { expect(all('.title').size).to eq 24}
  end


end