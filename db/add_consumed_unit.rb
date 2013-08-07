t = "2013-07-15 09:00:00"
tzdiff = 5 #timezone difference
num = 7 #how many consumed units to make

obj = ConsumableObject.find(4)

for i in 0..num
	cu = ConsumedUnit.new
	cu.amount = obj.amount
	cu.unit = obj.unit
	cu.created_at = t[0, 11] + (t[11, 2].to_i + i + tzdiff).to_s + t[13, 20]
	cu.consumable_type = obj.consumable_type
	cu.consumable_object = obj
	cu.save
end