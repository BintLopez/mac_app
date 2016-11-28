class CreateSupportRequests < ActiveRecord::Migration
  def change
    create_table :support_requests do |t|
      t.boolean :completed
      t.text :notes
      t.date :date_of_contact
      t.date :date_of_assistance
      t.belongs_to :guest, index: true
      t.string :referred_from

      t.timestamps null: false
    end
  end
end
