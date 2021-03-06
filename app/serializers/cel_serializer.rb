# frozen_string_literal: true

class CelSerializer < ActiveModel::Serializer
  attributes :id, :brand, :model, :imei1, :imei2, :stat
  belongs_to :stat
end
