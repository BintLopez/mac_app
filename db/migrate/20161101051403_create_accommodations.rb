class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.boolean :private
      t.string :bedding
      t.boolean :inactive
      t.belongs_to :host, index: true

      t.timestamps null: false
    end
  end
end
