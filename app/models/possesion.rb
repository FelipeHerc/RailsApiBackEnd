class Possesion < ApplicationRecord
  belongs_to :owner
  belongs_to :equip
end
