class UserMailer < ActionMailer::Base
  default from: "lipetsk@megre.ru"

  def welcome_email(user)
    @user = user
    mail to: 'i.borovinskiy@gmail.com',
         subject: 'Welcome to My Awesome Site'
  end
end
