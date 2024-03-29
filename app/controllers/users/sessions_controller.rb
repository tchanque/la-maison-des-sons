# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #after_create :active_sub
  # before_action :configure_sign_in_params, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # def active_sub
  #   if current_user && current_user.end_date && DateTime.now > current_user.end_date
  #     current_user.update(is_subscriber: false)
  #   end
  # end

end
