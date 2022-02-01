require 'rails_helper'

Rspec.describe 'Home Page', type: :feature do
  feature 'Home Page' do
    before(:each) do
      FactoryBot.create(:book)
      visit root_path
    end

    scenario 'Can see Latest books' do
      expect(find('#slider')).not_to be_nil
    end

    scenario 'Can see Get Started' do
      expect(page).to have_content('Get Started')
    end

    scenario 'Can see Best Sellers' do
      expect(page).to have_content('Best Sellers')
    end

    scenario 'Click on Get Started link' do
      find_link('Get Started').click
      expect(page).to have_current_path('/catalog')
    end

    scenario 'Buying Latest Book' do
      click_button('Buy now')
      expect(find('.hidden-xs .shop-quantity').text).to eq('1')
    end
  end
end