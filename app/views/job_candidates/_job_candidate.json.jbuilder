json.extract! job_candidate, :id, :name, :age, :current_address, :email, :phone_number, :created_at, :updated_at
json.url job_candidate_url(job_candidate, format: :json)
