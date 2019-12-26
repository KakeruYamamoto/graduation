class UsersController < ApplicationController
  def show
    @users = current_user.events
    @user = User.find(params[:id])
  end
end
