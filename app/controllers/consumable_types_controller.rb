class ConsumableTypesController < ApplicationController
  before_action :set_consumable_type, only: [:show, :edit, :update, :destroy]

  # GET /consumable_types
  # GET /consumable_types.json
  def index
    @consumable_types = ConsumableType.all
  end

  # GET /consumable_types/1
  # GET /consumable_types/1.json
  def show
  end

  # GET /consumable_types/new
  def new
    @consumable_type = ConsumableType.new
  end

  # GET /consumable_types/1/edit
  def edit
  end

  # POST /consumable_types
  # POST /consumable_types.json
  def create
    @consumable_type = ConsumableType.new(consumable_type_params)

    respond_to do |format|
      if @consumable_type.save
        format.html { redirect_to @consumable_type, notice: 'Consumable type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @consumable_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @consumable_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumable_types/1
  # PATCH/PUT /consumable_types/1.json
  def update
    respond_to do |format|
      if @consumable_type.update(consumable_type_params)
        format.html { redirect_to @consumable_type, notice: 'Consumable type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consumable_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumable_types/1
  # DELETE /consumable_types/1.json
  def destroy
    @consumable_type.destroy
    respond_to do |format|
      format.html { redirect_to consumable_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumable_type
      @consumable_type = ConsumableType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumable_type_params
      params.require(:consumable_type).permit(:name, :color)
    end
end
