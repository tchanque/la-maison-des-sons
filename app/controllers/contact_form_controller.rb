class ContactFormController < ApplicationController

  def new
    
  end

  def create
    @email = params[:contact_form][:email]
    @message = params[:contact_form][:message]

    ContactMailer.contact_message(@email, @message).deliver_now
    
    # Perform any necessary actions with the form data
    flash[:success] = "Votre message a bien été envoyé"
    redirect_to :root
  end

end

