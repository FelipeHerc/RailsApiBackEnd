# frozen_string_literal: true

class PossesionSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :owner
  belongs_to :equip
end
