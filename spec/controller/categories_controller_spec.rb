# # frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :controller do
  let(:category) {FactoryBot.create :category }

  context 'GET #index' do
    it 'returns success' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(Category.count)
    end
  end

  context 'POST #create' do
    it 'create category' do
      category_params = FactoryBot.attributes_for(:category)
      expect {post :create, params: {category: category_params}
      }.to change(Category, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  context 'GET #show' do
    it 'get category' do
      get :show, params: {id: category.id}
      expect(response).to be_successful
      expect(JSON.parse(response.body)['id']).to eq(category.id)
    end
  end

  context 'PUT #update' do
    it 'update category' do
      put :update, params: {id: category.id, category: {name: 'mudouuu'}}
      category.reload
      expect(category.name).to eq('mudouuu')
      expect(response).to have_http_status(:ok)
    end
  end

  context 'DELETE #destroy' do
    it 'destroy category' do
      category
      expect {delete :destroy, params: {id: category.id}
      }.to change(Category, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
