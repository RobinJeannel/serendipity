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

    # On veut récupérer les communautés
    params[:communities].each do |community_label|
      community = Community.find_by(name: community_label)
      current_user.memberships.build(community_id: community.id)
    end

    @user.save!
    redirect_to user_path
  end

end

