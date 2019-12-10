# frozen_string_literal: true

class ChipSerializer < ActiveModel::Serializer
  attributes :id, :operator, :ddd, :phoneNumber, :value, :stat, :costcenter
  belongs_to :stat
  belongs_to :costcenter
end
