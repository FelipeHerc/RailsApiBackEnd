class CreateJoinTableOwnersAccess < ActiveRecord::Migration[5.2]
  def change
    create_table :accesses_owners, id: false do |t|
      t.belongs_to :access
      t.belongs_to :owner
    end
  end
end