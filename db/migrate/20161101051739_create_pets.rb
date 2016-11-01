class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :type
      t.string :size
      t.string :behavior
      t.integer :host_id

      t.timestamps null: false
    end
  end
end
