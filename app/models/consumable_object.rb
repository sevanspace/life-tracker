class ConsumableObject < ActiveRecord::Base
	belongs_to :consumable_type
	has_many :consumed_units
end
