# frozen_string_literal: true

class ParthicipantManagementsController < ApplicationController
  before_action :authenticate_user!
  before_action :ended_event, only: [:create]

  def create
    parthicipante = current_user.parthicipant_managements.create(event_id: params[:event_id])
    redirect_to events_url, notice: "[#{parthicipante.event.title}]の参加しました"
  end

  def destroy
    parthicipante = current_user.parthicipant_managements.find(params[:id]).destroy
    redirect_to events_url, notice: "[#{parthicipante.event.title}]の参加をキャンセルしました"
  end

  private

  def ended_event
    if params[:event_id]
      event_date = Event.find(params[:event_id].to_i).e_date_start
  end
    redirect_to events_path, notice: 'このイベントは終了しています。' if event_date <= Time.now
  end
end
