class ConsumableObjectsController < ApplicationController
  before_action :set_consumable_object, only: [:show, :edit, :update, :destroy]

  # GET /consumable_objects
  # GET /consumable_objects.json
  def index
    @consumable_objects = ConsumableObject.all
  end

  # GET /consumable_objects/1
  # GET /consumable_objects/1.json
  def show
  end

  # GET /consumable_objects/new
  def new
    @consumable_object = ConsumableObject.new
  end

  # GET /consumable_objects/1/edit
  def edit
  end

  # POST /consumable_objects
  # POST /consumable_objects.json
  def create
    @consumable_object = ConsumableObject.new(consumable_object_params)

    respond_to do |format|
      if @consumable_object.save
        format.html { redirect_to @consumable_object, notice: 'Consumable object was successfully created.' }
        format.json { render action: 'show', status: :created, location: @consumable_object }
      else
        format.html { render action: 'new' }
        format.json { render json: @consumable_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumable_objects/1
  # PATCH/PUT /consumable_objects/1.json
  def update
    respond_to do |format|
      if @consumable_object.update(consumable_object_params)
        format.html { redirect_to @consumable_object, notice: 'Consumable object was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consumable_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumable_objects/1
  # DELETE /consumable_objects/1.json
  def destroy
    @consumable_object.destroy
    respond_to do |format|
      format.html { redirect_to consumable_objects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumable_object
      @consumable_object = ConsumableObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumable_object_params
      params.require(:consumable_object).permit(:amount, :unit, :name, :consumable_type_id)
    end
end
