Rails.application.configure do

  config.action_mailer.default_url_options = { host: 'stage.jeffreyrudes.com', protocol: 'http'  }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.mandrillapp.com',
    port:                 587,
    domain:               'jeffreyrudes.com',
    user_name:            'phil@mauinewyork.com',
    password:             'q9to_-EDRG5pcHL6dGLS7w',
    authentication:       'plain',
    enable_starttls_auto: true
  }

end
