require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the BooksHelper. For example:
#
# describe BooksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe BooksController, type: :controller do
  let(:book) { FactoryBot.create(:book)}

  describe 'GET #index' do
    before { get :index }

    it 'return a success response' do
      expect(response.status).to eq(200)
      expect(response).to render_template :index
    end

    it 'assign @books' do
      expect(assigns(:books)).not_to be_nil
    end
  end

  describe 'GET #show' do
    before do
      allow(Book).to receive(:find).and_return book
    end

    it 'receives find and return book' do
      expect(Book).to receive(:find).with(book.id.to_s)
      get :show, params: { id: book.id}
    end

    it 'assign @book' do
      get :show, params: {id: book.id}
      expect(assigns(:book)).not_to be_nil
    end

    it 'renders :show template' do
      get :show, params: {id: book.id}
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end
  end

end
