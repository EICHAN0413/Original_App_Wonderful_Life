class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?


    def login_required
      redirect_to new_user_session_path unless current_user
    end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [ :avatar, :profile, :birth_date])
    end

    def after_sign_in_path_for(resources)
      posts_path
    end



end
