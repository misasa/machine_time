json.array!(@machines) do |machine|
  json.extract! machine, :id, :global_id, :name, :description
  json.url machine_url(machine, format: :json)
end
