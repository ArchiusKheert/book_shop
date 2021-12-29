require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the OrdersHelper. For example:
#
# describe OrdersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe OrdersController, type: :controller do
  let(:user) { FactoryBot.create(:user)}
  let(:order) { FactoryBot.create(:order, :in_queue, user_id: user.id)}
  before { sign_in(user)}

  describe 'GET #index' do
    before { get :index}

    it 'assign @orders' do
      expect(assigns(:orders)).not_to be_nil
    end

    it 'return a success message' do
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: order.id}}

    it 'assign @order' do
      expect(assigns(:order)).not_to be_nil
    end

    it 'return a success message' do
      expect(response.status).to eq(200)
    end

    it 'render template show' do
      expect(response).to render_template :show
    end

  end
end
