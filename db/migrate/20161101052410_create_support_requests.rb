class CreateSupportRequests < ActiveRecord::Migration
  def change
    create_table :support_requests do |t|
      t.boolean :completed
      t.text :notes
      t.date :date_of_contact
      t.date :date_of_assistance
      t.integer :guest_id
      t.string :referred_from

      t.timestamps null: false
    end
  end
end
