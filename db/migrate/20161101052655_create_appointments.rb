class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :clinic, index: true
      t.datetime :appt_time
      t.belongs_to :guest, index: true

      t.timestamps null: false
    end
  end
end
