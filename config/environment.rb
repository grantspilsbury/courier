# Load the rails application
require File.expand_path('../application', __FILE__)

Courier::Application.configure do 
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :domain => "fasteddie.co.za",
    :address => "smtp.sendgrid.net",
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end

VALID_EMAIL_REGEX = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/i
VALID_URL_REGEX = /^(https?:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

# Initialize the rails application
Courier::Application.initialize!