class ApplicationController < ActionController::Base

  def index
    render template: "subscriber_mailer/welcome"
  end  

end 