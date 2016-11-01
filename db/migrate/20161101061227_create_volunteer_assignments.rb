class CreateVolunteerAssignments < ActiveRecord::Migration
  def change
    create_table :volunteer_assignments do |t|
      t.integer :support_request_id
      t.integer :volunteer_id
      t.string :status
      t.text :notes

      t.timestamps null: false
    end
  end
end
