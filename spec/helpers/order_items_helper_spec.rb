require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the OrderItemsHelper. For example:
#
# describe OrderItemsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe OrderItemsController, type: :controller do
  let!(:user) {FactoryBot.create(:user)}
  let(:book) {FactoryBot.create(:book)}

  before { sign_in(user) }

  describe "POST #create" do
    let(:create_params) {{ order_item: {book_id: book.id, quantity: 1}}}
    before {post :create, xhr: true, params: :create_params}

    it 'assign @order_item' do
      expect(assigns(:order_item)).not_to be_nil
    end

    it 'return a success message' do
      expect(response.status).to eq(200)
    end
    
  end

  describe 'PUT #update' do
    let(:update_params) do
      { id: FactoryBot.create(:order_item).id order_item: { quantity: 2}}
    end
    before { put :update, xhr: true, params: update_params}

    it 'assign @order_items' do
      expect(assigns(:order_items)).not_to be_nil
    end

    it 'return a success message' do
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE #destroy' do
    it 'return http success' do
      delete :destroy, xhr: true, params: {id: FactoryBot.create(:order_item)}
      expect(response.status).to eq(200)
    end

  end
end
