class StaticsController < ApplicationController
  before_action :load_categories

  def prod
  end

  def send_contact_email
    name = params[:name]
    email = params[:email]
    subject = params[:subject]
    body = params[:comments]
    UserMailer.contact_email(name, email, subject, body).deliver

    # flash[:sent] = 'Message sent!'
    redirect_to contact_path

  end

  private

  def load_categories
    @categories = Category.all
  end

end
