class CreateNotebooks < ActiveRecord::Migration[5.2]
  def change
    create_table :notebooks do |t|
      t.references :stat, foreign_key: true
      t.string :brand
      t.string :model
      t.string :serialNumber

      t.timestamps
    end
  end
end
