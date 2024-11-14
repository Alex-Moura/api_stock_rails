# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::V1::SuppliersController, type: :controller do
  let(:supplier) {FactoryBot.create :supplier }

  context 'GET #index' do
    it 'returns success' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(Supplier.count)
    end
  end

  context 'POST #create' do
    it 'create supplier' do
      supplier_params = FactoryBot.attributes_for(:supplier)
      expect { 
        post :create, params: {supplier: supplier_params}
    }.to change(Supplier, :count).by(1)
    expect(response).to have_http_status(:created)
    end
  end

  context 'GET #show' do
    it 'show supplier' do
      get :show, params: {id: supplier.id}
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(supplier.id)
    end
  end

  context 'PUT #update' do
    it 'update supplier' do
      put :update, params: {id: supplier.id, supplier: {name: 'mudou pp'}}
      supplier.reload  
      expect(supplier.name).to eq('mudou pp')
      expect(response).to have_http_status(:ok)
    end
  end

  context 'DELETE #destroy' do
    it 'destroy supplier' do
      supplier
      expect {
        delete :destroy, params: {id: supplier.id}
    }.to change(Supplier, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end  
  end
end
