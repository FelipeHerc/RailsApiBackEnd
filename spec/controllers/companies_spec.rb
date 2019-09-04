require 'rails_helper'
require 'ffaker'

describe CompaniesController, type: :controller do
  describe 'faz um get em company' do
    context 'em todos os registros' do
      it 'e retorna status 200' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'em um registro especifico' do
      it 'e retorna registro existente' do
        company_id = Company.first.id
        get :show, params: { id: company_id }
        response_body = JSON.parse(response.body)
        expect((response_body).fetch('data').fetch('id')).to eq(company_id.to_s)
      end

      it 'e retorna 404' do
        company_id = Company.last.id
        company_id = company_id + 1
        get :show, params: { id: company_id }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  context 'faz um post' do
    it 'e retorna status 201' do
      post :create, params: { company: { name: FFaker::JobBR.title } }
      expect(response).to have_http_status(201)
    end
  end
end