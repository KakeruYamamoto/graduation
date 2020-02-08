class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @users_followers = @user.followers
    end
  end

  def show
    @user = User.find(params[:id])
    @users = @user.events
  end

  def parthicipant
    @parthicipant = current_user.parthicipant_managements.find_by(event_id: @event.id)
  end

  def following
    if params[:user_id]
      @user = User.find(params[:user_id])
      @user_following = @user.following
    end
  end


end
