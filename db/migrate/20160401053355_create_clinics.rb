class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :title
      t.string :nearest_transit
      t.string :procedure_types
      t.string :site_url
      t.string :map_url

      t.timestamps null: false
    end
  end
end
