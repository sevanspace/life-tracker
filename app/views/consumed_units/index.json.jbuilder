json.array!(@consumed_units) do |consumed_unit|
  json.extract! consumed_unit, :amount, :unit, :consumable_type_id
  json.url consumed_unit_url(consumed_unit, format: :json)
end
