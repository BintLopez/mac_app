class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :contactable, polymorphic: true, index: true
      t.boolean :do_not_contact

      t.timestamps null: false
    end
  end
end
