class WidgetsData
	attr_accessor :data

	def initialize(dashboard)
		@dashboard = dashboard
		@data = {}
		@units_consumed_today = units_consumed_today

		@dashboard.showable_widgets.each do |w|
			case w
			when :consumed_units_table
				#sthg
			when :consumable_objects_buttons
				#sthg
			when :total_consumption_table
				#sthg
			when :consumed_today_timeline
				w_data = {:consumed_today => consumed_today, :first_hr => first_hr, :last_hr => last_hr}
				#sthg
			when :hourly_consumed_object_histogram
				w_data = {:consumable_objects_consumed_by_hour => consumable_objects_consumed_by_hour}
				#sthg
			when :total_consumption_by_day_chart
				w_data = {:consumable_objects_by_day => consumable_objects_by_day, :first_date_consumed => first_date_consumed}
				#sthg
			else
				#error check
			end
			w_data ||= {}
			@data[w] = w_data
		end
	end

	def first_hr
		if @units_consumed_today.empty? then 1 else time_created(@units_consumed_today.first).hour end
	end

	def last_hr
		if @units_consumed_today.empty? then 23 else time_created(@units_consumed_today.last).hour end
	end

	def units_consumed_today
		if ConsumedUnit.count > 0
			@units_consumed_today ||= ConsumedUnit.all.select {|cu| time_created(cu).day == Date.today.day && time_created(cu).month == Date.today.month && time_created(cu).year == Date.today.year}.sort_by! {|c| c.created_at}
		end
	end

	def consumed_today
#		"consumed_today"
		result = []
		units_consumed_today.each do |cu|
			result.push({
				:type => cu.consumable_type.name,
				:object => (cu.consumable_object && cu.consumable_object.name),
				:hour => time_created(cu).hour,
				:min => time_created(cu).min,
				:sec => time_created(cu).sec
				})
		end
		result

	end

	def consumable_objects_consumed_by_hour
		result = {}
		ConsumableObject.all.each do |co|
			result[co.name] = consumed_by_hour(co.consumable_type.name)
		end
		result
	end

	def consumed_by_hour (type)
		result = []
		for hr in 0..24
			total = (ConsumedUnit.count > 0) ? ConsumedUnit.all.select {|cu| cu.consumable_type.name == type && time_created(cu).hour == hr} : 0
			result[hr] = total.count
		end
		result
	end

	def consumable_objects_by_day
		result = {}
		ConsumableObject.all.each do |co|
			result[co.name] = consumed_by_day(co.consumable_type.name)
		end
		result
	end

	def consumed_by_day (type)
		result = {}
		if ConsumedUnit.count > 0
			ConsumedUnit.all.select{|cu| cu.consumable_type.name == type}.each do |cu|
				year = time_created(cu).year
				month = time_created(cu).month
				day = time_created(cu).day

				unless result[year]
					result[year] = {}
				end
				unless result[year][month]
					result[year][month] = {}
				end
				unless result[year][month][day]
					result[year][month][day] = 0
				end
				result[year][month][day] += 1
			end
		end
		result
	end

	def first_date_consumed
		if ConsumedUnit.count > 0 
			t = time_created(ConsumedUnit.all.order('created_at DESC').last)
		else
			t = Time.zone.now
		return {:year => t.year, :month => t.month, :day => t.day}
	end

	def time_created (record)
		record.created_at.in_time_zone('Central Time (US & Canada)')
	end
end