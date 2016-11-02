class CreateCompanions < ActiveRecord::Migration
  def change
    create_table :companions do |t|
      t.belongs_to :guest, index: true
      t.string :age
      t.string :gender

      t.timestamps null: false
    end
  end
end
