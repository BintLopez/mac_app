class CreateCompanions < ActiveRecord::Migration
  def change
    create_table :companions do |t|
      t.integer :guest_id
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
