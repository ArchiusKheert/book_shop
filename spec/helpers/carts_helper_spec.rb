require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CartsHelper. For example:
#
# describe CartsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CartsController, type: :controller do
  describe 'GET #show' do
    before { get :show}

    it 'assign @order' do
      expect(assigns(:order)).not_to be_nil
    end

    it 'return success response with show template' do
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end

  end
end
