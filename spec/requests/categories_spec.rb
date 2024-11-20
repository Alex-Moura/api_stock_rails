# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Categories API' do
  let(:category) {FactoryBot.create :category }

  describe 'GET /api/v1/categories' do
    before {get '/api/v1/categories'}
    it 'returns categories' do
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).size).to eq(Category.count)
    end
  end

    describe 'GET /api/v1/categories/:id' do
      before {get "/api/v1/categories/#{category.id}"}
      it 'return category' do
        expect(response).to be_successful
        expect(JSON.parse(response.body)['id']).to eq(category.id)
      end
    end

  describe 'POST /api/v1/categories' do
    context 'return created' do
      it 'create category' do
        category_params = FactoryBot.attributes_for(:category)
        post '/api/v1/categories', params: {category: category_params}
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PUT /api/v1/categories/:id' do
    before {put "/api/v1/categories/#{category.id}", params: {category: {name: 'mudou-de-nome'}}}
    context 'return success apdate category' do
      it 'update category' do
        category.reload
        expect(response).to have_http_status(200)
        expect(category.name).to eq('mudou-de-nome')
      end
    end
  end

  describe 'DELETE /api/v1/categories/:id' do
    before {delete "/api/v1/categories/#{category.id}"}
    context 'return 204' do
      it 'delete category' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
