json.extract! appointment, :id, :patient_id, :doctor_id, :day_id, :timeslot_id, :complaint_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
