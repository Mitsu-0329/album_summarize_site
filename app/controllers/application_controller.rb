class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, except: [:top,:about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  #後で、サインイン後はマイページに飛ぶように変更する。
  def after_sign_in_path_for(resource)
    user_path(current_user.id) 
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :family_code, :profile_image])
  end
end
