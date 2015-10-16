class UserMailer < ActionMailer::Base
  default from: "vmiretskaya@bigmir.net"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email, 
            :to => 'vmiretskaya@bigmir.net', 
            :subject => "A new contact form message from #{name}")
  end

  def mail_confirmation(user, subject)
    @user = user
    mail(to: user.email, subject: subject)
  end

end

