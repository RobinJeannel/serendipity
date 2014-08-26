class CommunitiesController < ApplicationController

  def index
    @communities = Community.all
  end

  def show
    @Community = Community.find(params[:id])
  end

  private
  def community_params
    params.require(:community).permit(:name)
  end
end

