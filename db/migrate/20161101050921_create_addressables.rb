class CreateAddressables < ActiveRecord::Migration
  def change
    create_table :addressables do |t|
      t.integer :address_id
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps null: false
    end
  end
end
