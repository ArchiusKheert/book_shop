require 'rails_helper'

Rspec.feature 'Checkout', type: :feature do
  let(:user) { FactoryBot.create(:user)}

  before do
    FactoryBot.create(:book)
    FactoryBot.create_list(:delivery, 3)

  end

  scenario 'Checkout process' do
    login_as(user, scope: :user)
    visit root_path
    find('input[value="Buy now"]').click
    find('a.shop-link.hidden-xs').click
    expect(page.current_path).to eq carts_path
    find('a[href="/checkout/login"].hidden-xs').click
    expect(page.current_path).to eq checkout_path(:addresses)

    within('form#new_addresses_form') do
      %w[billing shipping].each do |type|
        fill_in "addresses_form[#{type}][first_name]", with: 'Johnny'
        fill_in "addresses_form[#{type}][last_name]", with: 'Good'
        fill_in "addresses_form[#{type}][address]", with: "R Street 13"
        fill_in "addresses_form[#{type}][city]", with: "Dnipro"
        fill_in "addresses_form[#{type}][zip]", with: '49000'
        select('Ukraine', from: "addresses_form[#{type}][country]")
        fill_in "addresses_form[#{type}][phone]", with: "88003553535"
      end

      click_button('Save and Continue')
    end

    expect(page.current_path).to eq checkout_path(:delivery)
    all('.radio-label').first.click
    click_button('Save and Continue')
    expect(page.current_path).to eq checkout_path(:payment)

    within('form#new_credit_card') do
      fill_in "credit_card[number]", with: '0123456789101112'
      fill_in "credit_card[name_on_card]", with: "Johnny Good"
      fill_in "credit_card[month_year]", with: "01/25"
      fill_in "credit_cart[cvv]", with: "012"

      click_button('Save and Continue')
    end

    expect(page.current_path).to eq checkout_path(:confirm)

    click_button('Place Order')
    expect(page.current_path).to eq checkout_path(:complete)
    expect(page).to have_content "An order confirmation has been sent to #{user.email}"
  end
end