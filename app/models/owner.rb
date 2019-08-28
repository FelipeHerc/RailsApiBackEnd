class Owner < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :sector, optional: true
end