# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'transation API' do
  let(:transation) {FactoryBot.create :transation }
  let(:product) {FactoryBot.create :product }
  

  describe 'GET /api/v1/transations' do
    before {get '/api/v1/transations'}
    context 'return 200' do
      it 'return success' do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).size).to eq(Transation.count)
      end
    end
  end
  
  describe 'GET /api/v1/transations/:id' do
    before {get "/api/v1/transations/#{transation.id}"}
    context 'return success' do
      it 'return transation' do
        expect(response).to be_successful
        expect(JSON.parse(response.body)['id']).to eq(transation.id)
      end
    end
  end

  describe 'POST /api/v1/transations' do
    context 'return created' do
      it 'create transation' do
        transation_params = FactoryBot.attributes_for(:transation, product_id: product.id )
        post '/api/v1/transations', params: {transation: transation_params}
        expect(response).to have_http_status(201)
      end
    end
  end


  describe 'PUT /api/v1/transations/:id' do
    before {put "/api/v1/transations/#{transation.id}", params: {transation: {type_transation: 'saida'}}}
    context 'return success apdate transation' do
      it 'update transation' do
        transation.reload
        expect(response).to have_http_status(200)
        expect(transation.type_transation).to eq('saida')
      end
    end
  end


  describe 'DELETE /api/v1/transations/:id' do
    before {delete "/api/v1/transations/#{transation.id}"}
    context 'delete transation' do
      it 'delete transation and return status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
