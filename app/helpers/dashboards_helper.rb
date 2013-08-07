module DashboardsHelper

	def process_rescue_time_script (record)
		result = record.script
		i = result.index('width:')
		result = result[0, i + 'width:'.length] + record.width.to_s + result[i + 'width:'.length + record.width.to_s.length, result.length]
		i = result.index('height:')
		result = result[0, i + 'height:'.length] + record.height.to_s + result[i + 'height:'.length + record.height.to_s.length, result.length]
		result
	end

	def render_js (widget_id)
		javascript_include_tag ("charts/" + widget_id + ".js")
	end

	def time_created (record)
		record.created_at.in_time_zone('Central Time (US & Canada)')
	end

end
