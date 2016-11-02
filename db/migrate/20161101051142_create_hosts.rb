class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.belongs_to :volunteer, index: true
      t.integer :guest_capacity
      t.boolean :inactive

      t.timestamps null: false
    end
  end
end
