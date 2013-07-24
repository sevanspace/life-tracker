json.array!(@consumable_types) do |consumable_type|
  json.extract! consumable_type, :name
  json.url consumable_type_url(consumable_type, format: :json)
end
