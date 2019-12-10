# frozen_string_literal: true

class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :email, :company, :sector, :access, :city
end
