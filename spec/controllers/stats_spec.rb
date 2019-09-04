require 'rails_helper'
require 'ffaker'

describe StatsController, type: :controller do
  describe 'faz um get em status' do
    context 'em todos os registros' do
      it 'e retorna status 200' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'em um registro especifico' do
      it 'e retorna registro existente' do
        status_id = Stat.first.id
        get :show, params: { id: status_id }
        response_body = JSON.parse(response.body)
        expect((response_body).fetch('data').fetch('id')).to eq(status_id.to_s)
      end

      it 'e retorna 404' do
        status_id = Stat.last.id
        status_id = status_id + 1
        get :show, params: { id: status_id }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  context 'faz um post' do
    it 'e retorna status 201' do
      post :create, params: { stat: { description: FFaker::Filesystem.extension } }
      expect(response).to have_http_status(201)
    end
  end
end