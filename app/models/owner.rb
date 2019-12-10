# frozen_string_literal: true

class Owner < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :sector, optional: true
  belongs_to :city, optional: true
  has_and_belongs_to_many :access
end
