class ContactMailer < ApplicationMailer
  default to: ENV['MAILJET_DEFAULT_FROM'], # adresse de l'admin (admin@gmail.com) -- pour l'instant, mon adresse perso
  from: "contact.test.lmds@gmail.com" # adresse intermédiaire (contact.test.lmds@gmail.com)

  def contact_message(email, message)
    @email = email
    @message = message

    mail("reply-to": email , subject: "Nouveau message de contact", body: message)
  end
end
