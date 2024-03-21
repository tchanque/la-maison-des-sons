class ContactMailer < ApplicationMailer
  default to: "ra.marcarini@gmail.com",
  from: "contact@yopmail.com"

  def contact_message(email, message)
    @email = email
    @message = message

    mail("reply-to": email , subject: "Nouveau message de contact", body: message)
  end
end
