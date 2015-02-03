class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @search = Service.search(params[:q])
    @models = @search.result.page(params[:page]).per(50)
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @model = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @model = Service.new(service_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to @model, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    model = @model
    respond_to do |format|
      if model.update(service_params)
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

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @model = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :provider_aptour_id, :operator_aptour_id)
    end
end
