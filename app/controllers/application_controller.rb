class ApplicationController < ActionController::Base
  # # MEANS THE FIRST ACTION FOR THE USER WHEN HE ARRIVES ON THE APP IS TO LOG IN
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # HERE WE ADD SOME PERMISSION TO DEVISE TO UPDATE USER_PROFILE. Because devise accept only email, password and password_confirmation by default
    def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :description, :password, :current_password, :password_confirmation)}
    end
end
