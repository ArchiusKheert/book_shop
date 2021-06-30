require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  let(:review_params) {FactoryBot.attributes_for(:review).stringify_keys}
  let(:review) {FactoryBot.build_stubbed(:review)}

  describe "GET #show" do
    before do
      allow(Review).to receive(:find).and_return review
    end

    it 'receives find and return review' do
      expect(Review).to receive(:find).with(review.id.to_s)
      get :show, params: {id: review.id}
    end

    it 'assigns @review' do
      get :show, params: {id: review.id}
      expect(assigns(:review)).not_to be_nil
    end

    it 'renders :show template' do
      get :show, params: {id: review.id}
      expect(response).to render_template :show
    end
  end
end
