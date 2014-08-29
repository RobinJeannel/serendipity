class AfterSignUpController < ApplicationController
  include Wicked::Wizard
  before_filter :authenticate_user!

  steps :add_communities

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user

    # On récupére les communautés
    communities = params[:communities] || {}
    communities.keys.each do |id|
      current_user.memberships.build(community_id: id.to_i)
      if @user.save
        redirect_to user_path
      else
        flash[:notice] = @user.errors.full_messages.join
        redirect_to :back
      end
    end

  end
end

