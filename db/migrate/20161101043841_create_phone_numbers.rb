class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.boolean :inactive
      t.string :type
      t.belongs_to :contact, index: true

      t.timestamps null: false
    end
  end
end
