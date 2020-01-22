class ParthicipantManagementsController < ApplicationController
    before_action :authenticate_user!
  def create
    parthicipante = current_user.parthicipant_managements.create(event_id: params[:event_id])
    redirect_to events_url, notice: "[#{parthicipante.event.title}]の参加しました"
  end

  def destroy
    parthicipante = current_user.parthicipant_managements.find_by(id: params[:id]).destroy
    redirect_to events_url, notice: "[#{parthicipante.event.title}]の参加をキャンセルしました"
  end
end
