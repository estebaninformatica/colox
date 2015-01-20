class AptourDestinationsController < ApplicationController

  def index
    search = ""
    search = params[:q] unless params[:q].nil?
    url = File.join(AeroAPI::AptourDestination.site.to_s, 'aptour_destinations', 'criteria', search)
    render json: AeroAPI::AptourDestination.find(:all, from: url)
  end

  def show
    render json: AeroAPI::AptourDestination.find(params[:id])
  end

end