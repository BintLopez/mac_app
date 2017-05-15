class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.references :callable, polymorphic: true, index: true
      t.string :number
      t.boolean :inactive
      t.string :type

      t.timestamps null: false
    end
  end
end
