# frozen_string_literal: true

class Chip < ApplicationRecord
  belongs_to :stat
  belongs_to :costcenter
end
