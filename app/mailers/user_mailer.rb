class UserMailer < ApplicationMailer
  default from: ENV['MAILJET_DEFAULT_FROM']

  def welcome_email(user, password)
    @user = user
    @url = "https://la-maison-des-sons.fly.dev/users/sign_in"
    @password = password

    mail(to: @user.email, subject: "Bienvenue à la Maison des sons !")
  end

end
