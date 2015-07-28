class UserMailer < ActionMailer::Base
	default from: 'info@jeffreyrudes.com'
  layout 'mailer'

	def welcome_email(user)
    @user = user
  end

  def reset_password(user, password)
    @user = user
    @password = password
    default_url_options[:host]
    mail(to: @user.email, subject: 'Jeffrey Rudes :: Password Reset').deliver
  end
end
