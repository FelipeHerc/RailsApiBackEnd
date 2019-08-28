class CelSerializer < ActiveModel::Serializer
  attributes :id, :brand, :model, :imei1, :imei2
  belongs_to :stat
end
