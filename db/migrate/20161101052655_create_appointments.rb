class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :clinic_id
      t.datetime :appt_time
      t.integer :support_request_id

      t.timestamps null: false
    end
  end
end
