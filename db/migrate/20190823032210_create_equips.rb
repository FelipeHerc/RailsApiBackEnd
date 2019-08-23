class CreateEquips < ActiveRecord::Migration[5.2]
  def change
    create_table :equips do |t|
      t.references :notebook, foreign_key: true
      t.references :chip, foreign_key: true
      t.references :cel, foreign_key: true

      t.timestamps
    end
  end
end
