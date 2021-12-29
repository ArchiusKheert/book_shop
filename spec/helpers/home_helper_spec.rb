require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeController, type: :controller do
  let!(:books) {FactoryBot.create_list(:book, 10) }

  describe 'GET #index' do
    before {get :index}

    it 'assign @latest_books' do
      expect(assigns(:latest_books)).to match_array(books.last(3))
      expect(response).to render_template :index
    end

    it 'assign @bestsellers' do
      expect(assigns(:bestsellers)).not_to be_nil
    end

    it 'render home index' do
      expect(response).to render_template :index
    end

    it 'return a success message' do
      expect(response.status).to eq(200)
    end
  end
end
