class ApplicationController < ActionController::Base
  # # MEANS THE FIRST ACTION FOR THE USER WHEN HE ARRIVES ON THE APP IS TO LOG IN
 before_action :authenticate_user!
  # SET THE LOCALE 
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  # HERE WE ADD SOME PERMISSION TO DEVISE TO UPDATE USER_PROFILE. Because devise accept only email, password and password_confirmation by default
    def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :description, :password, :current_password, :password_confirmation, :end_date, :is_subscriber, :is_teacher, :is_admin, :avatar)}
         devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :is_admin, :is_teacher, :is_subscriber, :description, :password, :password_confirmation)}
    end

  private

  # DEF LOCALE TO UPDATE THE LOCALE IF IT CHANGES
  def set_locale
    if params[:locale]
      I18n.locale = params[:locale]
    end
  end


end
