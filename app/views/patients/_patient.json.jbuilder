json.extract! patient, :id, :user_id, :name, :allergy, :created_at, :updated_at
json.url patient_url(patient, format: :json)