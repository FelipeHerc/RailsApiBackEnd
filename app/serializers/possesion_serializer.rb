class PossesionSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :owner
  belongs_to :equip
end
