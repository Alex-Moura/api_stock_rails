# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  let(:product) {FactoryBot.create :product }
  let(:category) { FactoryBot.create :category }
  let(:supplier) { FactoryBot.create :supplier }

  describe 'GET #index' do
    it 'returns status 200' do
      get :index
      expect(response).to be_successful
      expect(JSON.parse(response.body).size).to eq(Product.count)
    end
  end

    describe 'POST #create' do
      it 'creates a new Produto' do
        product_params = FactoryBot.attributes_for(:product, category_id: category.id, supplier_id: supplier.id)
        expect {post :create, params: { product: product_params }
      }.to change(Product, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end
  
  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: product.id }
      expect(response).to be_successful
      expect(JSON.parse(response.body)['id']).to eq(product.id)
    end
  end

  describe 'PUT #update' do
   it 'update product' do
     put :update, params: {id: product.id, product: {name: 'mudou'}}
     product.reload
     expect(product.name).to eq('mudou')
     expect(response).to have_http_status(:ok)
   end
  end

    describe 'DELETE #destroy' do
    it 'deletes the product' do
      product
      expect {
        delete :destroy, params: { id: product.id }
      }.to change(Product, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
