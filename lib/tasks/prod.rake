# frosetupzen_string_literal: true

require 'cpf_faker'

namespace :prod do
  desc 'configura ambiente de dev'
  task setup: :environment do
    p 'criando setores...'
    sectors = %w[TI Comercial Dev Adm]
    sectors.each do |sector|
      Sector.create!(
        name: sector
      )
    end

    p 'criando empresas...'
    empresas = %w[Outcenter AVOS]
    empresas.each do |empresa|
      Company.create!(
        name: empresa
      )
    end

    p 'criando status...'
    descriptions = ['Disponível', 'Ocupado', 'Manutenção', 'Desativado/Cancelado']
    descriptions.each do |description|
      Stat.create!(
        description: description
      )
    end

    p 'criando access...'
    Access.create!(
      description: 'Área remota'
    )
    Access.create!(
      description: 'ANM'
    )
    Access.create!(
      description: 'VPN'
    )
    Access.create!(
      description: 'Jera'
    )
    Access.create!(
      description: 'GLPI'
    )
    Access.create!(
      description: 'Número de ramal'
    )
    Access.create!(
      description: '@outcenter'
    )
    Access.create!(
      description: '@grupocenter'
    )
    Access.create!(
      description: '@avos'
    )
    Access.create!(
      description: 'Boleto Verde'
    )
    Access.create!(
      description: 'Pagcenter'
    )
    Access.create!(
      description: 'CRM'
    )
    Access.create!(
      description: 'Metrics'
    )
    Access.create!(
      description: 'Gestão RH'
    )
    Access.create!(
      description: 'PSI'
    )
    Access.create!(
      description: 'Elastix'
    )
    Access.create!(
      description: 'Terminal 6'
    )
  end
end
