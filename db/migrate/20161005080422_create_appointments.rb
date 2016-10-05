class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.integer :date_id
      t.integer :timeslot_id
      t.integer :complaint_id

      t.timestamps
    end
  end
end
