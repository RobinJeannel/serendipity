class UsersController < ApplicationController

  def index
  end

  def show
    @communities = current_user.communities
  end

  def edit
  end

  def update
  end
end
