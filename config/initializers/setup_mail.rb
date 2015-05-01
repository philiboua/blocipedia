if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.mandrillapp.com',
    port:           '587',
    user_name:      ENV['MANDRILL_USERNAME'],
    password:       ENV['MANDRILL_APIKEY'],
    domain:         'heroku.com',
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }
end