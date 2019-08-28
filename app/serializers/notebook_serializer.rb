class NotebookSerializer < ActiveModel::Serializer
  attributes :id, :brand, :model, :serialNumber
  belongs_to :stat
end
