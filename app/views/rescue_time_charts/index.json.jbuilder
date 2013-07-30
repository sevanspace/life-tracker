json.array!(@rescue_time_charts) do |rescue_time_chart|
  json.extract! rescue_time_chart, :title, :key, :show, :width, :height, :script
  json.url rescue_time_chart_url(rescue_time_chart, format: :json)
end
