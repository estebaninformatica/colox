class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # GET /hotels
  # GET /hotels.json
  def index
    @models = Hotel.order("name").page(params[:page]).per(50)
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
  end

  # GET /hotels/new
  def new
    @model = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels
  # POST /hotels.json
  def create
    @model = Hotel.new(hotel_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to @model, notice: 'Hotel was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    model = @model
    respond_to do |format|
      if model.update(hotel_params)
        format.html { redirect_to model, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: model }
        format.js   { render js: '$.notify(" Listo '+model.name+'", "success");'}
      else
        format.html { render :edit }
        format.json { render json: model.errors, status: :unprocessable_entity }
        format.js   { render js: '$.notify("Error");'}
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @model = Hotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_params
      params.require(:hotel).permit(:name, :provider_aptour_id, :operator_aptour_id)
    end
end
