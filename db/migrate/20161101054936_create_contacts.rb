class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :contactable_id
      t.string :contactable_type
      t.boolean :do_not_contact

      t.timestamps null: false
    end
  end
end
