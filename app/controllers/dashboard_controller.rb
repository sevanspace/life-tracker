class DashboardController < ApplicationController

  def index
  	@consumable_objects_consumed_by_hour = {}
    @consumable_objects_by_day = {}
  	ConsumableObject.all.each do |co|
  		@consumable_objects_consumed_by_hour[co.name] = consumed_by_hour(co.consumable_type.name)
      @consumable_objects_by_day[co.name] = consumed_by_day(co.consumable_type.name)

  	end
    @first_date_consumed = {:year => time_created(ConsumableObject.first).year, :month => time_created(ConsumableObject.first).month, :day => time_created(ConsumableObject.first).day}
  end


#helpers

#TODO: get separate counts for Type (continuous) and Object (discrete); aka how much water vs how many water_bottles

  def consumed_by_hour (type)
    result = []
    for hr in 0..24
      total = ConsumedUnit.all.select {|cu| cu.consumable_type.name == type && time_created(cu).hour == hr}
      result[hr] = total.count
    end
    result
  end

  def consumed_by_day (type)
    result = {}

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
    result
  end

  def time_created (record)
    record.created_at.in_time_zone('Central Time (US & Canada)')
  end

end