class EventChangeMailer < ApplicationMailer
  def event_change(*emails)

    emails.each do |email|
      mail to: @event_owner_email, subject: "お問い合わせの確認メール"
  end
end
