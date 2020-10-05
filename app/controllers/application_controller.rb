class ApplicationController < ActionController::Base
before_action :config_permitted_parameters, if: :devise_controller?


  private
  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date])
  end
end
