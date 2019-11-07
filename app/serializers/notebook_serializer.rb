# frozen_string_literal: true

class NotebookSerializer < ActiveModel::Serializer
  attributes :id, :brand, :model, :serialNumber, :stat
  belongs_to :stat
end
