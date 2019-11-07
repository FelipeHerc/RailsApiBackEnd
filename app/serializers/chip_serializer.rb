# frozen_string_literal: true

class ChipSerializer < ActiveModel::Serializer
  attributes :id, :operator, :ddd, :phoneNumber, :value, :stat
  belongs_to :stat
end
