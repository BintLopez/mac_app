class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.text :notes
      t.belongs_to :person, index: true
      t.boolean :allergies
      t.boolean :male_okay
      t.boolean :pets_okay
      t.belongs_to :support_request, index: true

      t.timestamps null: false
    end
  end
end
