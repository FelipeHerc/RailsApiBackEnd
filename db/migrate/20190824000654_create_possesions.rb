# frozen_string_literal: true

class CreatePossesions < ActiveRecord::Migration[5.2]
  def change
    create_table :possesions do |t|
      t.references :owner, foreign_key: true
      t.references :equip, foreign_key: true

      t.timestamps
    end
  end
end
