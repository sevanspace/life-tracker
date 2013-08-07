class ConsumableType < ActiveRecord::Base
	has_many :consumable_objects
	has_many :consumed_units

	#TODO: more straight-forward way of getting colors?
#	@type_colors = get_colors

	def self.type_colors
		#TODO get this working so it doesn't always go to the database
		result = {}
		ConsumableType.all.each do |ct|
			result[ct.name] = ct.color
		end
		result
		#get_colors
	end

	def get_colors
		#....
	end

end
