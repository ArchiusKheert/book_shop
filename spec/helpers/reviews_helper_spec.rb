require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ReviewsController, type: :controller do
  let!(:user) { FactoryBot.create(:user)}
  before { sign_in(user)}

  it 'assign @review' do
    @book = FactoryBot.create(:book)
    post :create, params: {book_id: @book.id, review: { rating: 5, title: 'Title', text: 'Text'}}
    expect(assigns(:review)).not_to be_nil
  end

  context 'with valid review' do
    before do
      @book = FactoryBot.create(:book)
      allow_any_instance_of(Review).to receive(:save).and_return true
      post :create, params: { book_id: @book.id, review: { rating: 5, title: 'Title', text: 'Text'}}
    end

    it 'send success flash' do

      expect(flash[:success]).to eq 'Review was uploaded. Waiting for admin checking'
    end
  end

  context 'with invalid save' do
    before do
      @book = FactoryBot.create(:book)
      allow_any_instance_of(Review).to receive(:save).and_return false
      post :create, params: { book_id: @book.id, review: {rating: 5, title: 'Title', text: 'Text'}}
    end

    it 'send error flash' do
      expect(flash[:danger]).not_to be_nil
    end
  end
end
