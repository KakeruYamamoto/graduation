class ContactMailer < ApplicationMailer
  def contact_mail(contact)
      @contact = contact
      @event_owner_email = @contact.event.user.email
      mail to: @event_owner_email, subject: "お問い合わせの確認メール"
  end
end
