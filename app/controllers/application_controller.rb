class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def landing
  end

  # def after_sign_in_path_for(user)
  #   user
  # end


    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(User)
        resource_or_scope
      elsif resource_or_scope.is_a?(AdminUser)
        admin_dashboard_path(resource_or_scope)
      end
    end


end
