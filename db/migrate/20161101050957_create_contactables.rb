class CreateContactables < ActiveRecord::Migration
  def change
    create_table :contactables do |t|
      t.integer :contact_id
      t.integer :contactable_id
      t.string :contactable_type

      t.timestamps null: false
    end
  end
end
