class DashboardsController < ApplicationController
  include ChartsDataHelper

  before_filter :units_consumed_today
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /consumed_units
  # GET /consumed_units.json
  def index
  	@consumable_objects_consumed_by_hour = {}
    @consumable_objects_by_day = {}
  	ConsumableObject.all.each do |co|
  		@consumable_objects_consumed_by_hour[co.name] = consumed_by_hour(co.consumable_type.name)
      @consumable_objects_by_day[co.name] = consumed_by_day(co.consumable_type.name)

  	end

    @first_date_consumed = first_consumed_hash

    @consumed_today = consumed_today_hash

    @type_colors = type_colors()

#    @first_hr = if @units_consumed_today.empty? then 1 else time_created(@units_consumed_today.first).hour end
#    @last_hr = if @units_consumed_today.empty? then 23 else time_created(@units_consumed_today.last).hour end

  end

  # GET /dashboards/new
  def new
    @dashboard = Dashboard.new
  end

  # GET /dashboards/1
  # GET /dashboards/1.json
  def show
  end

  # GET /dashboards/1/edit
  def edit
    @widgets = @dashboard.widgets
  end

  # POST /dashboards
  # POST /dashboards.json
  def create
    @dashboard = Dashboard.new(dashboard_params)

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dashboard }
      else
        format.html { render action: 'new' }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboards/1
  # PATCH/PUT /dashboards/1.json
  def update
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end

    enabled_widgets = params[:widgets] || {}
    Dashboard.available_widgets.each do |(feature,_)|
      if enabled_widgets.include?(feature)
        @dashboard.widgets.merge!({feature => true})
      else
        @dashboard.widgets.except!(feature)
      end
      @dashboard.save
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.json
  def destroy
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to dashboards_url }
      format.json { head :no_content }
    end
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

  def first_consumed_hash
    t = time_created(ConsumedUnit.all.order('created_at DESC').last)
    return {:year => t.year, :month => t.month, :day => t.day}
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

  def units_consumed_today
    @units_consumed_today = ConsumedUnit.all.select {|cu| time_created(cu).day == Date.today.day && time_created(cu).month == Date.today.month && time_created(cu).year == Date.today.year}.sort_by! {|c| c.created_at}

  end

  def consumed_today_hash
    result = []
    @units_consumed_today.each do |cu|
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

  
  def type_colors
    result = {}
    ConsumableType.all.each do |ct|
      result[ct.name] = ct.color
    end
    result
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_params
      params.require(:dashboard).permit(:widgets, :name, :show)
    end
end