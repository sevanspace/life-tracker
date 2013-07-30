class RescueTimeChartsController < ApplicationController
  before_action :set_rescue_time_chart, only: [:show, :edit, :update, :destroy]

  # GET /rescue_time_charts
  # GET /rescue_time_charts.json
  def index
    @rescue_time_charts = RescueTimeChart.all
  end

  # GET /rescue_time_charts/1
  # GET /rescue_time_charts/1.json
  def show
  end

  # GET /rescue_time_charts/new
  def new
    @rescue_time_chart = RescueTimeChart.new
  end

  # GET /rescue_time_charts/1/edit
  def edit
  end

  # POST /rescue_time_charts
  # POST /rescue_time_charts.json
  def create
    @rescue_time_chart = RescueTimeChart.new(rescue_time_chart_params)

    respond_to do |format|
      if @rescue_time_chart.save
        format.html { redirect_to @rescue_time_chart, notice: 'Rescue time chart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @rescue_time_chart }
      else
        format.html { render action: 'new' }
        format.json { render json: @rescue_time_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rescue_time_charts/1
  # PATCH/PUT /rescue_time_charts/1.json
  def update
    respond_to do |format|
      if @rescue_time_chart.update(rescue_time_chart_params)
        format.html { redirect_to @rescue_time_chart, notice: 'Rescue time chart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rescue_time_chart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rescue_time_charts/1
  # DELETE /rescue_time_charts/1.json
  def destroy
    @rescue_time_chart.destroy
    respond_to do |format|
      format.html { redirect_to rescue_time_charts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rescue_time_chart
      @rescue_time_chart = RescueTimeChart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rescue_time_chart_params
      params.require(:rescue_time_chart).permit(:title, :key, :show, :width, :height, :script)
    end
end
