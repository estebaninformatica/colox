class TravelOperatorsController < ApplicationController
  before_action :set_travel_operator, only: [:show, :edit, :update, :destroy]

  # GET /travel_operators
  # GET /travel_operators.json
  def index
    @models = TravelOperator.order("name").page(params[:page]).per(50)
  end

  # GET /travel_operators/1
  # GET /travel_operators/1.json
  def show
  end

  # GET /travel_operators/new
  def new
    @travel_operator = TravelOperator.new
  end

  # GET /travel_operators/1/edit
  def edit
  end

  # POST /travel_operators
  # POST /travel_operators.json
  def create
    @travel_operator = TravelOperator.new(travel_operator_params)

    respond_to do |format|
      if @travel_operator.save
        format.html { redirect_to @travel_operator, notice: 'Travel operator was successfully created.' }
        format.json { render :show, status: :created, location: @travel_operator }
      else
        format.html { render :new }
        format.json { render json: @travel_operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_operators/1
  # PATCH/PUT /travel_operators/1.json
  def update
    model = @travel_operator
    respond_to do |format|
      if model.update(travel_operator_params)
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

  # DELETE /travel_operators/1
  # DELETE /travel_operators/1.json
  def destroy
    @travel_operator.destroy
    respond_to do |format|
      format.html { redirect_to travel_operators_url, notice: 'Travel operator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_operator
      @travel_operator = TravelOperator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_operator_params
      params.require(:travel_operator).permit(:name, :operator_aptour_id)
    end
end
