# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Product API', type: :request do
  let(:product) {FactoryBot.create :product }
  let(:category) {FactoryBot.create :category }
  let(:supplier) {FactoryBot.create :supplier }

  describe 'GET api/v1/products' do
    before {get '/api/v1/products'}

    it 'return all products' do
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(Product.count)
    end
  end

  describe 'POST api/v1/products' do
    it 'created product' do
      product_params = FactoryBot.attributes_for(:product, supplier_id: supplier.id, category_id: category.id)
      post '/api/v1/products', params: {product: product_params}
      expect(response).to have_http_status(201)
    end
  end

  describe 'GET api/v1/products/:id' do
    before {get "/api/v1/products/#{product.id}"}
    it 'return products' do
      expect(response).to be_successful
      expect(JSON.parse(response.body)['id']).to eq(product.id)
    end
  end

  describe 'PUT api/v1/products/:id' do
    before {put "/api/v1/products/#{product.id}", params: {product: {name: 'mudanca'}}}
    it 'return product' do
      product.reload  
      expect(response).to have_http_status(200)
      expect(product.name).to eq('mudanca')
    end
  end

  describe 'DELETE /api/v1/products/:id' do
    before {delete "/api/v1/products/#{product.id}"}
    it 'delete product' do
      expect(response).to have_http_status(204)
    end
  end
end

