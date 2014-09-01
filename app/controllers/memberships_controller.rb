class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @communities = Community.all
    @memberships = current_user.memberships
  end

  def create
    community = Community.find(params[:community_id])

    unless current_user.member_of? community
      current_user.memberships.create(community_id: community.id)
    end

    @memberships = current_user.memberships

    respond_to do |format|
      format.html {redirect_to memberships_path }
      format.js { render "subscription" }
    end
  end

  def destroy
    membership = Membership.find(params[:id])
    membership.destroy
    @memberships = current_user.memberships
    respond_to do |format|
      format.html {redirect_to memberships_path}
      format.js { render "subscription" }
    end
  end
end

