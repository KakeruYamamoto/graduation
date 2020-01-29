class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id), notice:  "アカウントが違います。アクセスするには再ログインしてください"
    end
    @users = current_user.events
  end

  def parthicipant
    @parthicipant = current_user.parthicipant_managements.find_by(event_id: @event.id)
  end
end
