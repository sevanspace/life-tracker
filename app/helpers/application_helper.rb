module ApplicationHelper

	def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def consumed_by_hour (type)
    result = []
    for hr in 0..24
      total = ConsumedUnit.all.select {|cu| cu.created_at.hour == hr}
      result[hr] = total.count
    end
    result
  end

  def consumued_time_hash (type)
    result = Hash.new
    ConsumedUnit.all.each do |cu|
    end
  end

end

