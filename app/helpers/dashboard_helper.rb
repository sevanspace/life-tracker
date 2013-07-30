module DashboardHelper

	def process_rescue_time_script (record)
		result = record.script
		i = result.index('width:')
		result = result[0, i + 'width:'.length] + record.width.to_s + result[i + 'width:'.length + record.width.to_s.length, result.length]
		i = result.index('height:')
		result = result[0, i + 'height:'.length] + record.height.to_s + result[i + 'height:'.length + record.height.to_s.length, result.length]
		result
	end
end
