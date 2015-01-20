class AssistanceFareGroupsController < ApplicationController
  before_action :set_assistance_fare_group, only: [:show, :edit, :update, :destroy]

  # GET /assistance_fare_groups
  # GET /assistance_fare_groups.json
  def index
    @models = AssistanceFareGroup.order("name").page(params[:page]).per(50)
  end

  # GET /assistance_fare_groups/1
  # GET /assistance_fare_groups/1.json
  def show
  end

  # GET /assistance_fare_groups/new
  def new
    @assistance_fare_group = AssistanceFareGroup.new
  end

  # GET /assistance_fare_groups/1/edit
  def edit
  end

  # POST /assistance_fare_groups
  # POST /assistance_fare_groups.json
  def create
    @assistance_fare_group = AssistanceFareGroup.new(assistance_fare_group_params)

    respond_to do |format|
      if @assistance_fare_group.save
        format.html { redirect_to @assistance_fare_group, notice: 'Assistance fare group was successfully created.' }
        format.json { render :show, status: :created, location: @assistance_fare_group }
      else
        format.html { render :new }
        format.json { render json: @assistance_fare_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assistance_fare_groups/1
  # PATCH/PUT /assistance_fare_groups/1.json
  def update
    model = @assistance_fare_group
    respond_to do |format|
      if model.update(assistance_fare_group_params)
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

  # DELETE /assistance_fare_groups/1
  # DELETE /assistance_fare_groups/1.json
  def destroy
    @assistance_fare_group.destroy
    respond_to do |format|
      format.html { redirect_to assistance_fare_groups_url, notice: 'Assistance fare group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assistance_fare_group
      @assistance_fare_group = AssistanceFareGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assistance_fare_group_params
      params.require(:assistance_fare_group).permit(:name, :provider_aptour_id, :operator_aptour_id)
    end
end
