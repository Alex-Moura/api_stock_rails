# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::V1::TransationsController, type: :controller do
  let(:transation) { FactoryBot.create :transation }
  let(:product) { FactoryBot.create :product }

  describe 'GET #index' do
    context 'transation valid' do
      it 'returns status 200' do
        get :index
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body).size).to eq(Transation.count)
      end
    end
  end

  context 'GET #show' do
    it 'returns transation' do
      get :show, params: { id: transation.id }
      expect(response).to be_successful
      expect(JSON.parse(response.body)['id']).to eq(transation.id)
    end
  end

  describe 'POST #create' do
    it 'creates a new Transaction' do
      transation_params = FactoryBot.attributes_for(:transation, product_id: product.id)
      expect {post :create, params: { transation: transation_params }
    }.to change(Transation, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT #update' do
    it 'update product' do
      put :update, params: {id: transation.id, transation: {type_transation: 'mudou'}}
      transation.reload
      expect(transation.type_transation).to eq('mudou')
      expect(response).to have_http_status(:ok)
    end
 end

  describe 'DELETE #destroy' do
    it 'delete transation' do
      transation
      expect {
        delete :destroy, params: {id: transation.id}
    }.to change(Transation, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
