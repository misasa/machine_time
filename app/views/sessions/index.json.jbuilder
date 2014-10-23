json.array!(@sessions) do |session|
  json.extract! session, :id, :global_id, :name, :description, :started_at, :stopped_at, :machine_id, :user_id
  json.url session_url(session, format: :json)
end
