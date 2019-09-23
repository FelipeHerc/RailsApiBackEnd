# frozen_string_literal: true

class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :company, :sector, :access
end
