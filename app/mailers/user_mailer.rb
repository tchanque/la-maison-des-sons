class UserMailer < ApplicationMailer
  default from: ENV['MAILJET_DEFAULT_FROM']

  def welcome_email(user, password)
    @user = user
    @url = "https://la-maison-des-sons.fly.dev/users/sign_in"
    @password = password
    mail(to: @user.email, subject: "Bienvenue à la Maison des sons !")
  end

  
  def event_delete(user, event)
    @user = user
    @event = event
    mail(to: @user.email, subject: "#{@event.category} n'aura pas lieu !")
  end

end
