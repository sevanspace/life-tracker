class ConsumedUnit < ActiveRecord::Base
	belongs_to :consumable_type
	belongs_to :consumable_object
end
