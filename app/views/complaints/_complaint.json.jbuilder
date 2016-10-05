json.extract! complaint, :id, :complaint, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)