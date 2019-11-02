class AddIsActiveToPossesion < ActiveRecord::Migration[5.2]
  def change
    add_column :possesions, :isActive, :bool, default: true
  end
end
