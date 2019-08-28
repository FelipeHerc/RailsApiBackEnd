# frozen_string_literal: true

class CreateChips < ActiveRecord::Migration[5.2]
  def change
    create_table :chips do |t|
      t.references :stat, foreign_key: true
      t.string :operator
      t.string :ddd
      t.string :phoneNumber
      t.money :value

      t.timestamps
    end
  end
end
