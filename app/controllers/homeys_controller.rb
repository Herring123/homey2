class HomeysController < ApplicationController

  before_action :authenticate_user!

  def index
    @homeys = Homey.all
  end

  def show
    @homey = Homey.find(params[:id])
    @comments = @homey.comments.order('created_at DESC')
    @comment = Comment.new
  end

  def update
    homey = Homey.find(params[:id])

    flash[:alert] = "Failed to update" unless homey.update(homey_params)

    redirect_to homey_path(homey)
  end

  def homey_params
    params.require(:homey).permit(:status)
  end
end

