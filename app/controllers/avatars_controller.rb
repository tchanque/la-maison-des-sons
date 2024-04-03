class AvatarsController < ApplicationController
  # Link to ActiveStorage
  def create
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    redirect_to(user_path(@user))
  end
end