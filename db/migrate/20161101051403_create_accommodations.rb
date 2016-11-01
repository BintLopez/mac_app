class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.boolean :private
      t.string :bedding
      t.boolean :inactive
      t.integer :host_id

      t.timestamps null: false
    end
  end
end
