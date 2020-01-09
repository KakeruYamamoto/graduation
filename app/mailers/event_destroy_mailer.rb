class EventDestroyMailer < ApplicationMailer

  def event_destroy(email,event_info)
    @event_info = event_info
    mail to: email, subject: "イベントが中止になりました。"
  end
end
