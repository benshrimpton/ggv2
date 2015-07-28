class EmailController < ApplicationController 
  
  def subscriber
    @subscriber = Gemgento::Subscriber.last
    render 'subscriber_mailer/welcome', layout: 'mailer'
  end

  def order
    @order = Gemgento::Order.find_by(:increment_id => "100000123")
    render 'gemgento/sales_mailer/order_email', layout: 'mailer'
  end  

  def shipment
    @order = Gemgento::Order.first
    render 'gemgento/sales_mailer/shipment_email', layout: 'mailer'
  end 

  def credit_memo
    @order = Gemgento::Order.find(3)
    render 'gemgento/sales_mailer/credit_memo_email', layout: 'mailer'
  end 

  def invoice
    @order = Gemgento::Order.first
    render 'gemgento/sales_mailer/invoice_email', layout: 'mailer'
  end 

  def reset
    render 'gemgento/user/mailer/reset_password_instructions', layout: 'mailer'
  end


  def welcome
    render 'subscriber_mailer/sign_up_welcome_email', layout: 'mailer'
  end

  # def return
  #   @order = Gemgento::Order.find(48)
  #   render 'gemgento/sales_mailer/credit_memo_email', layout: 'mailer'
  # end


end