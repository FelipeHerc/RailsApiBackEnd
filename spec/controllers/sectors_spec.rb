require 'rails_helper'
require 'ffaker'

describe SectorsController, type: :controller do
  context 'faz um get em sector' do
    context 'em todos os registros' do
      it 'e retorna status 200' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'em um registro especifico' do
      it 'e retorna registro existente' do
        sector_id = Sector.first.id
        get :show, params: { id: sector_id }
        response_body = JSON.parse(response.body)
        expect((response_body).fetch('data').fetch('id')).to eq(sector_id.to_s)
      end

      it 'e retorna 404' do
        sector_id = Sector.last.id
        sector_id = sector_id + 1
        get :show, params: { id: sector_id }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  context 'faz um post' do
    it 'e retorna status 201' do
      post :create, params: { sector: { name: FFaker::JobBR.title } }
      expect(response).to have_http_status(201)
    end
  end
end