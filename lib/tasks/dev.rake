# frosetupzen_string_literal: true

require 'cpf_faker'

namespace :dev do
  desc 'configura ambiente de dev'
  task setup: :environment do

    p 'criando usuario mestre, detentor de todo o conhecimento do kosmo, ou como alguns dizem: kosm...'
    User.create!(
      email: 'felipe@herc.com',
      password: '12341234',
      password_confirmation: '12341234'
    )

    p 'criando centros de custo...'
    centers = ['Infra/Redes', 'Projetos', 'Instalação']
    centers.each do |center| 
      Costcenter.create!(
        name: center
      )
    end

    p 'criando setores...'
    sectors = %w[TI Comercial Dev Adm]
    sectors.each do |sector|
      Sector.create!(
        name: sector
      )
    end

    p 'criando cidades...'
    cities = ['Bahia', 'Poços de Caldas', 'Botelhos']
    cities.each do |city|
      City.create!(
        name: city
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

    p 'criando notebooks...'
    50.times do |i|
    notebook = Notebook.create!(
      brand: Faker::Games::Dota.hero,
      model: Faker::Games::Dota.item,
      serialNumber: Faker::Number.number(digits: 15),
      stat: Stat.order('RANDOM()').first
    )
    Equip.create!(
      notebook_id: notebook.id
    )
    end

    p 'criando chips...'
    50.times do |i|
    chip = Chip.create!(
      operator: Faker::Games::Pokemon.name,
      ddd: rand(100),
      phoneNumber: Faker::PhoneNumber.cell_phone_with_country_code,
      value: rand(10),
      stat: Stat.order('RANDOM()').first,
      costcenter: Costcenter.order('RANDOM()').first
    )
    Equip.create!(
      chip_id: chip.id
    )
    end

    p 'criando cels...'
    50.times do |i|
    cel = Cel.create!(
      brand: Faker::Books::Lovecraft.deity,
      model: Faker::Creature::Dog.breed,
      imei1: Faker::Number.number(digits: 15),
      imei2: Faker::Number.number(digits: 15),
      stat: Stat.order('RANDOM()').first
    )
    Equip.create!(
      cel_id: cel.id
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

    p 'criando owners...'
    100.times do |i|
      Owner.create!(
        name: Faker::Name.name,
        cpf: Faker::CPF.pretty,
        email: Faker::Internet.email,
        sector: Sector.order('RANDOM()').first,
        company: Company.order('RANDOM()').first,
        city: City.order('RANDOM()').first,
        access: Access.find([rand(1..17), rand(1..17), rand(1..17)])
      )
    end

    p 'criando possesions...'
    100.times do |i|
      Possesion.create!(
        owner_id: Owner.order('RANDOM()').first.id,
        equip_id: Equip.order('RANDOM()').first.id
      )
    end
  end
end
