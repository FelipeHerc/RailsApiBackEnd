require 'rails_helper'
require 'cpf_faker'
require 'ffaker'

describe OwnersController, type: :controller do
  describe 'faz um get em owner' do
    context 'em todos os registros' do
      it 'e retorna status 200' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'em um registro especifico' do
      it 'e retorna registro existente' do
        owner_id = Owner.first.id
        get :show, params: { id: owner_id }
        response_body = JSON.parse(response.body)
        expect((response_body).fetch('data').fetch('id')).to eq(owner_id.to_s)
      end

      it 'e retorna 404' do
        owner_id = Owner.last.id
        owner_id = owner_id + 1
        get :show, params: { id: owner_id }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  context 'faz um post' do
    it 'e retorna status 201' do
      post :create, params: 
      { 
        owner: 
        { 
          name: FFaker::NameBR.name,
          cpf: Faker::CPF.pretty,
          email: Faker::Internet.email,
          sector_id: Sector.all.sample.id,
          company_id: Company.all.sample.id 
        } 
      }
      expect(response).to have_http_status(201)
    end
  end
end