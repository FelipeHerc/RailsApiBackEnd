class EquipSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :notebook, optional: true
  belongs_to :chip, optional: true
  belongs_to :cel, optional: true
end
