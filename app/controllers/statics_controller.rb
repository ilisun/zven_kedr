class StaticsController < ApplicationController
  before_action :load_categories

  def prod
  end

  def send_contact_email
    name = params[:name]
    email = params[:email]
    subject = params[:subject]
    body = params[:comments]
    @ip_address = request.remote_ip

    UserMailer.contact_email(name, email, subject, body, @ip_address).deliver

    redirect_to contact_path
  end

  def send_order_email
    order_name = params[:order_name]
    name = params[:name]
    tel = params[:tel]
    @ip_address = request.remote_ip

    UserMailer.order_email(name, tel, order_name, @ip_address).deliver

    redirect_to root_path
  end

  private

  def load_categories
    @categories = Category.all
  end

end
