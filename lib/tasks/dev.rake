require 'cpf_faker'

namespace :dev do
  desc "configura ambiente de dev"
  task setup: :environment do

    p "criando setores..."
    sectors = %w(TI Comercial Dev Adm)
    sectors.each do |sector|
      Sector.create!(
        name: sector
      )
    end

    p "criando empresas..."
    empresas = %w(Outcenter AVOS)
    empresas.each do |empresa|
      Company.create!(
        name: empresa
      )
    end
  

    p "criando owners..."
    100.times do |i|
      Owner.create!(
        name: Faker::Name.name,
        cpf: Faker::CPF.pretty,
        email: Faker::Internet.email,
        sector: Sector.order('RANDOM()').first,
        company: Company.order('RANDOM()').first
      )
    end

    p 'criando status...'
    descriptions = ['Disponível', 'Ocupado', 'Manutenção', 'Desativado/Cancelado']
    descriptions.each do |description|
      Stat.create!(
        description: description
      )
    end
  end
end
