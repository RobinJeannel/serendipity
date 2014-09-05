class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find_by_slug!(params[:id])
    @communities = @user.communities
    @articles = Article.published.where(community: @user.community_ids).order(created_at: :desc)
  end

  def edit
  end

  def update
  end
end
