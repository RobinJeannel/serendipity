class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  protected
    def after_sign_up_path_for(resource)
      after_sign_up_path(:add_communities)
    end


end
