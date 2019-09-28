# frozen_string_literal: true

class EquipSerializer < ActiveModel::Serializer
  attributes :id, :notebook, :chip, :cel
  belongs_to :notebook, optional: true
  belongs_to :chip, optional: true
  belongs_to :cel, optional: true
end
