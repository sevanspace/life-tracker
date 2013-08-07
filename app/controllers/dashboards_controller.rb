class DashboardsController < ApplicationController
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /consumed_units
  # GET /consumed_units.json
  def index
    @dashboards = Dashboard.all
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