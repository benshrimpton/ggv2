class SubscriberMailer < ActionMailer::Base
  default from: 'info@jeffreyrudes.com'
  layout 'mailer'


  def sign_up_welcome_email(user)
    @user = user
    default_url_options[:host]
    mail(to: @user.email, subject: 'Welcome to Jeffrey Rüdes')
  end
  

  def welcome(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: 'Jeffrey Rüdes Newsletter Subscription').deliver  
  end

end