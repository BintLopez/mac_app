class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.date :training_date
      t.boolean :can_drive
      t.date :docs_received_date
      t.text :notes
      t.boolean :inactive
      t.string :position
      t.integer :person_id

      t.timestamps null: false
    end

    add_index :volunteers, :person_id
  end
end
