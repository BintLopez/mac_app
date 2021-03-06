class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :street_address_1
      t.string  :street_address_2
      t.string  :city
      t.string  :state
      t.string  :zip_code
      t.string  :neighborhood
      t.references :addressable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
