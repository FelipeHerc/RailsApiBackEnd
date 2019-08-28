# frozen_string_literal: true

class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.string :description

      t.timestamps
    end
  end
end
