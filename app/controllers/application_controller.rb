class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name,
      :last_name,
      :address,
      :city,
      :zipcode,
      :dob,
      :country_code,
      :language_code,
      :persontype,
      :email,
      :password,
      :password_confirmation
      ])
  end

end
