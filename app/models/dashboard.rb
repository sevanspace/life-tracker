class Dashboard < ActiveRecord::Base
	store :widgets

	WIDGETS = {
		:consumed_units_table => 'Consumed Units Table',
		:consumable_objects_buttons => 'Consumable Objects Buttons',
		:total_consumption_table => 'Total Consumption Table',
		:consumed_today_timeline => 'Consumed Today Timeline',
		:hourly_consumed_object_histogram => 'Hourly Consumed Object Histogram',
		:total_consumption_by_day_chart => 'Total Consumption by Day Chart'
	}


	def self.available_widgets
		WIDGETS
	end

	def showable_widgets
		result = []
		Dashboard.available_widgets.each do |key, val|
			if widgets[key]
				result << key
			end
		end
		result
	end
end

