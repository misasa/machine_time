json.array!(@machines) do |machine|
  json.extract! machine, :id, :global_id, :name, :description, :session_prefix, :state
  json.url machine_url(machine, format: :json)
end
