class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :role
      t.string :do_not_contact

      t.timestamps null: false
    end
  end
end
