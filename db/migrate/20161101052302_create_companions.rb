class CreateCompanions < ActiveRecord::Migration
  def change
    create_table :companions do |t|
      t.integer :guest_id
      t.string :age
      t.string :gender

      t.timestamps null: false
    end
  end
end
