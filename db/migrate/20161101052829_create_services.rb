class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
