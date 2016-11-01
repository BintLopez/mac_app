class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.text :notes
      t.integer :person_id
      t.integer :support_request_id
      t.boolean :allergies
      t.boolean :male_okay
      t.boolean :pets_okay

      t.timestamps null: false
    end
  end
end
