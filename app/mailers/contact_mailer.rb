class ContactMailer < ApplicationMailer
  default to: ENV['MAILJET_DEFAULT_FROM'], # adresse de l'admin (admin@gmail.com)
  from: "contact.test.lmds@gmail.com" # adresse intermédiaire (contact.test.lmds@gmail.com)

  def contact_message(email, name, subject, message)
    @email = email
    @message = message
    @name = name
    @subject = subject

    mail("reply-to": email, subject: subject, body: message)
  end
end
