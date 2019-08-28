class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf
  belongs_to :company, optional: true
  belongs_to :sector, optional: true
end
