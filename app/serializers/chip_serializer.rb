class ChipSerializer < ActiveModel::Serializer
  attributes :id, :operator, :ddd, :phoneNumber, :value
  belongs_to :stat
end