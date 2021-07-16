class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameter, if: :devise_controller?

  private
  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end
end
