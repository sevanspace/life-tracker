class ConsumableType < ActiveRecord::Base
	has_many :consumable_objects
	has_many :consumed_units
end
