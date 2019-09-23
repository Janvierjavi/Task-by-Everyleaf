json.extract! task, :id, :name, :details, :created_at, :updated_at
json.url task_url(task, format: :json)
