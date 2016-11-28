class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :type
      t.string :size
      t.string :behavior
      t.belongs_to :host, index: true

      t.timestamps null: false
    end
  end
end
