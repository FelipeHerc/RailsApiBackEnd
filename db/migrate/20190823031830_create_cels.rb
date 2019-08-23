class CreateCels < ActiveRecord::Migration[5.2]
  def change
    create_table :cels do |t|
      t.references :stat, foreign_key: true
      t.string :brand
      t.string :model
      t.string :imei1
      t.string :imei2

      t.timestamps
    end
  end
end
