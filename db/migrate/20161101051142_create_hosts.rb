class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.integer :volunteer_id
      t.integer :guest_capacity
      t.boolean :inactive

      t.timestamps null: false
    end
  end
end
