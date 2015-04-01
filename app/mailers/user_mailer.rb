class UserMailer < ActionMailer::Base
  default from: "lipetsk@megre.ru"

  def contact_email(name, email, subject, body, ip_address)
    @name = name
    @email = email
    @subject = "[ Письмо с сайта ] - " + subject
    @body = body
    @ip_address = ip_address

    mail to: 'i.borovinskiy@gmail.com',
         subject: @subject
  end

end
