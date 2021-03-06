class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :gender
      t.date    :date_of_birth
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
