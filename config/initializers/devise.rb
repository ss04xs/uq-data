Devise.setup do |config|
  require 'devise/orm/active_record'
  config.omniauth :google_oauth2,
    Rails.application.secrets.google_client_id, #クライアントID
    Rails.application.secrets.google_client_secret, #シークレットID
    name: :google,
    scope: %w(email) 
end