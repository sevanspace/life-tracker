class MainController < ApplicationController

	before_filter :get_showable_dashboards



	def index
		@dashboard_data = {}
		@dashboards.each do |d|
			@dashboard_data[d.name] = WidgetsData.new(d).data
		end

		#TODO: separate this out into its own partial(?)
		@type_colors = ConsumableType.type_colors
	end


	def get_showable_dashboards
		@dashboards = Dashboard.all.select{|d| d.show}
	end

end