class UsersController < ApplicationController

  def index
  end

  def show
    @communities = current_user.communities
    @articles = Article.published.where(community: current_user.community_ids).order(created_at: :desc)
  end

  def edit
  end

  def update
  end
end
