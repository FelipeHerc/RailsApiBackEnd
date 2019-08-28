# frozen_string_literal: true

class Equip < ApplicationRecord
  belongs_to :notebook, optional: true
  belongs_to :chip, optional: true
  belongs_to :cel, optional: true
end
