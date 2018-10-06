class ProfileController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @photos = Photo.where(user: current_user)
  end

  private
  def user_params
    params.require(:user).permit(:email, :username)
  end
end
