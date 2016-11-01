class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :position
      t.boolean :board_member
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
