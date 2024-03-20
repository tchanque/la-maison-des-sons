class ApplicationController < ActionController::Base
  # MEANS THE FIRST ACTION FOR THE USER WHEN HE ARRIVES ON THE APP IS TO LOG IN
  before_action :authenticate_user!
end
