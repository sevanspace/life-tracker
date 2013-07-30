class DropRescueTimeCharts < ActiveRecord::Migration
	def up
		drop_table :rescue_time_charts
	end

end
