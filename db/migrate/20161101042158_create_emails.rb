class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address
      t.integer :contact_id
      t.boolean :do_not_email

      t.timestamps null: false
    end
  end
end
