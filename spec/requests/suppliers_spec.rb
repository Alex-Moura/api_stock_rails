# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Suppliers API' do
  let!(:supplier) {FactoryBot.create :supplier }

  describe 'GET /api/v1/suppliers' do
    before {get '/api/v1/suppliers'}
    context 'return success' do
      it 'get all suppliers' do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).size).to eq(Supplier.count)
      end
    end
  end

  describe 'GET /api/v1/suppliers/:id' do
    before {get "/api/v1/suppliers/#{supplier.id}"}
    context 'return success' do
      it 'return supplier' do
        expect(response).to be_successful
        expect(JSON.parse(response.body)['id']).to eq(supplier.id)
      end
    end
  end

  describe 'POST /api/v1/suppliers' do
    context 'return created' do
      it 'create supplier' do
        supplier_params = FactoryBot.attributes_for(:supplier)
        post '/api/v1/suppliers', params: {supplier: supplier_params}
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PUT /api/v1/suppliers/:id' do
    before {put "/api/v1/suppliers/#{supplier.id}", params: {supplier: {name: 'mudou_de_nome'}}}
    context 'return success apdate supplier' do
      it 'update supplier' do
        supplier.reload
        expect(response).to have_http_status(200)
        expect(supplier.name).to eq('mudou_de_nome')
      end
    end
  end

  describe 'DELETE /api/v1/suppliers/:id' do
    before {delete "/api/v1/suppliers/#{supplier.id}"}
    context 'return 204' do
      it 'delete supplier' do
        expect(response).to have_http_status(204)
      end
    end
  end



end
