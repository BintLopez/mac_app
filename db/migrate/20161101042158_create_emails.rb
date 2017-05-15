class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.references :emailable, polymorphic: true, index: true
      t.string :address
      t.boolean :inactive

      t.timestamps null: false
    end
  end
end
