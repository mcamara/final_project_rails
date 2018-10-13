class UsersController < ApplicationController
  def index
    @friends = current_user.active_friends + current_user.received_friends
    @exclude_list = [current_user] + @friends
    @users = User.where.not(id: @exclude_list)
  end

  def show
    @user = User.find(params[:id])
  end
end
