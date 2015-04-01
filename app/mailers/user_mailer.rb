class UserMailer < ActionMailer::Base
  default from: "lipetsk@megre.ru"

  def contact_email(name, email, subject, body)
    @name = name
    @email = email
    @subject = subject
    @body = body

    mail to: 'i.borovinskiy@gmail.com',
         subject: 'Welcome to My Awesome S'
  end

end
