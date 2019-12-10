class CreateCostcenters < ActiveRecord::Migration[5.2]
  def change
    create_table :costcenters do |t|
      t.string :name

      t.timestamps
    end
  end
end
