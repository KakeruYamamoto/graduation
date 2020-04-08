# frozen_string_literal: true

class EventChangeMailer < ApplicationMailer
  def event_change(email, event_info)
    @email = email
    @event_info = event_info
    mail to: @email, subject: 'イベントの詳細の変更'
  end
end
