require 'rails_helper'

Rspec.feature 'Cart', type: :feature do

  scenario 'Go to empty Cart' do
    visit root_path
    find('a.shop-link.pull-right.hidden-xs').click

    expect(page.current_path).to eq carts_path
    expect(page).to have_content 'Cart is empty'
  end

  scenario 'Go to full Cart' do
    FactoryBot.create(:book)
    visit root_path
    click_button('Buy now')
    find('a.shop-link.pull-right.hidden-xs').click

    expect(page.current_path).to eq carts_path
    expect(page).not_to have_content 'Cart is empty'
  end

  scenario 'Item details. Click on photo or title redirect to book page' do
    @book = FactoryBot.create(:book)
    visit root_path
    click_button('Buy now')
    find('a.shop-link.pull-right.hidden-xs').click

    expect(page.current_path).to eq carts_path
    expect(page).not_to have_content 'Cart is empty'

    within('.table.table-hover') do
      find('.general-img-wrap-table').find('a').click
    end
    expect(page.current_path).to eq books_path(@book)

    visit carts_path
    within('.table.table-hove') do
      find('.title-link').click
    end
    expect(page.current_path).to eq books_path(@book)
  end
end