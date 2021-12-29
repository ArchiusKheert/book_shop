require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AddressesHelper. For example:
#
# describe AddressesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AddressesController, type: :controller do
  let!(:user) {FactoryBot.create(:user)}

  before { sign_in(user)}

  describe 'GET #index' do
    before { get :index}

    it 'return a success response' do
      expect(response.status).to eq(200)
      expect(response).to render_template :index
    end

    it 'assign @addresses' do
      expect(assigns(:addresses)).not_to be_nil
    end
  end

  describe 'POST #create' do
    let(:address) {FactoryBot.attributes_for(:address) }
    let(:addresses_params) { { billing: address, shipping: address} }
    before { post :create, params: { addresses_form: addresses_params}}

    it 'assign @addresses' do
      expect(assigns(:addresses)).not_to be_nil
    end

    it 'return a success response' do
      expect(response.status).to eq(200)
    end

    it 'render index' do
      expect(response).to render_template :index
    end
  end

  describe 'PATCH #update' do
    let(:address) {FactoryBot.attributes_for(:address) }
    let(:addresses_params) { { billing: address, shipping: address} }
    before { patch :update, params: { addresses_from: addresses_params}}

    it 'assign @addresses' do
      expect(assigns(:addresses)).not_to be_nil

    end

    it 'return a success response' do
      expect(response.status).to eq(200)
    end

    it 'render index' do
      expect(response).to render_template :index
    end

  end
end
