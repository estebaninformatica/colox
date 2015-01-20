class TGroupsController < ApplicationController
  before_action :set_t_group, only: [:show, :edit, :update, :destroy]

  # GET /t_groups
  # GET /t_groups.json
  def index
   @models = TGroup.order("name").page(params[:page]).per(50)

  end

  # GET /t_groups/1
  # GET /t_groups/1.json
  def show
  end

  # GET /t_groups/new
  def new
    @t_group = TGroup.new
  end

  # GET /t_groups/1/edit
  def edit
  end

  # POST /t_groups
  # POST /t_groups.json
  def create
    @t_group = TGroup.new(t_group_params)

    respond_to do |format|
      if @t_group.save
        format.html { redirect_to @t_group, notice: 'T group was successfully created.' }
        format.json { render :show, status: :created, location: @t_group }
      else
        format.html { render :new }
        format.json { render json: @t_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /t_groups/1
  # PATCH/PUT /t_groups/1.json
  def update
    model = @t_group
    respond_to do |format|
      if model.update(t_group_params)
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

  # DELETE /t_groups/1
  # DELETE /t_groups/1.json
  def destroy
    @t_group.destroy
    respond_to do |format|
      format.html { redirect_to t_groups_url, notice: 'T group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_group
      @t_group = TGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def t_group_params
      params.require(:t_group).permit(:name, :provider_aptour_id, :operator_aptour_id)
    end
end
