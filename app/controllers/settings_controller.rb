class SettingsController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
  end

  def destroy_account
    @user = current_user

    # Delete all user's data
    @user.destroy

    # Clear session
    session[:user_id] = nil

    # Redirect to homepage
    redirect_to root_path, notice: "Your account has been deleted."
  end
end
