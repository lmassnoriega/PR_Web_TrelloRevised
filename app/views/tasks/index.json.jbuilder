json.array!(@tasks) do |task|
  json.extract! task, :id, :author, :title, :description, :duration, :begindate, :duedate, :responsible, :completed
  json.url task_url(task, format: :json)
end
