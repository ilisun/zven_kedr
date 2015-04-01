class UserMailer < ActionMailer::Base
  default from: "lipetsk@megre.ru"

  def contact_email(name, email, subject, body, ip_address)
    @name = name
    @email = email
    @subject = "[ Письмо с сайта ] - " + subject
    @body = body
    @ip_address = ip_address

    mail to: 'lipetsk@megre.ru',
         subject: @subject
  end

  def order_email(name, tel, order_name, ip_address)
    @order_name = order_name
    @name = name
    @tel = tel
    @subject = "[ Заказ продукции с сайта ] - " + order_name
    @ip_address = ip_address

    mail to: 'lipetsk@megre.ru',
         subject: @subject
  end

end
