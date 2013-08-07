class ConsumedUnitsController < ApplicationController
  before_action :set_consumed_unit, only: [:show, :edit, :update, :destroy]

  # GET /consumed_units
  # GET /consumed_units.json
  def index
    @consumed_units = ConsumedUnit.all.order('created_at DESC')
  end

  # GET /consumed_units/1
  # GET /consumed_units/1.json
  def show
  end

  # GET /consumed_units/new
  def new
    @consumed_unit = ConsumedUnit.new
  end

  # GET /consumed_units/1/edit
  def edit
  end

  # POST /consumed_units
  # POST /consumed_units.json
  def create
    @consumed_unit = ConsumedUnit.new(consumed_unit_params)
    @consumed_unit.save

    respond_to do |format|
      if @consumed_unit.save
        format.html { redirect_to '/', notice: 'Consumed unit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @consumed_unit }
      else
        format.html { render action: 'new' }
        format.json { render json: @consumed_unit.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /consumed_units/1
  # PATCH/PUT /consumed_units/1.json
  def update
    respond_to do |format|
      if @consumed_unit.update(consumed_unit_params)
        format.html { redirect_to @consumed_unit, notice: 'Consumed unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consumed_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumed_units/1
  # DELETE /consumed_units/1.json
  def destroy
    @consumed_unit.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Consumed unit was DELETED.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumed_unit
      @consumed_unit = ConsumedUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumed_unit_params
      params.require(:consumed_unit).permit(:amount, :unit, :consumable_type_id, :consumable_object_id)
    end
end
