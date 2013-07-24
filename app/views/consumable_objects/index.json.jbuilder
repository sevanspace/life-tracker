json.array!(@consumable_objects) do |consumable_object|
  json.extract! consumable_object, :amount, :unit, :consumable_type_id
  json.url consumable_object_url(consumable_object, format: :json)
end
