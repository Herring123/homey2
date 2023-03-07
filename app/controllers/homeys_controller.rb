class HomeysController < ApplicationController

  before_action :authenticate_user!

  def index
    @homeys = Homey.all
  end

  def show
    @homey = Homey.find(params[:id])
    @comment = Comment.new
  end

  def update
    homey = Homey.find(params[:id])
    if homey.update!(homey_params)
      flash[:notice] = "Successfully Updated"
    else
      flash[:alert] = "Failed to update"
    end
    redirect_to homey_path(homey)
  end

  def homey_params
    params.require(:homey).permit(:status)
  end
end

