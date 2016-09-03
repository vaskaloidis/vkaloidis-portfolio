json.extract! project, :id, :name, :categories, :order, :displayed, :modified, :created_at, :updated_at
json.url project_url(project, format: :json)