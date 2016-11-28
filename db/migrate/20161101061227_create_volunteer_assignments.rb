class CreateVolunteerAssignments < ActiveRecord::Migration
  def change
    create_table :volunteer_assignments do |t|
      t.belongs_to :support_request, index: true
      t.belongs_to :volunteer, index: true
      t.string :status
      t.text :notes

      t.timestamps null: false
    end
  end
end
