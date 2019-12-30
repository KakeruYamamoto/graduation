class ParthicipantManagementsController < ApplicationController
  def create
    parthicipant = current_user.parthicipant_managements.create(event_id: params[:event_id])
    redirect_to events_url, notice: "[#{parthicipant_management.event.title}]の参加しました"
  end

  def destroy
    parthicipant = current_user.parthicipant_managements.find_by(id: params[:id]).destroy
    redirect_to events_url, notice: "[#{parthicipant_management.event.title}]の参加をキャンセルしました"
  end
end
