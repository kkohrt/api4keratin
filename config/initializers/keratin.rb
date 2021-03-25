Keratin::AuthN.config.tap do |config|
  # The AUTHN_URL of your Keratin AuthN server. This will be used to verify tokens created by AuthN,
  # and will also be used for API calls unless `config.authn_url` is also set (see below).
  config.issuer = 'localhost:8080' # 'https://authn.myapp.com'

  # The domain of your application (no protocol). This domain should be listed in the APP_DOMAINS of
  # your Keratin AuthN server.
  config.audience = 'localhost' # 'myapp.com'

  # Credentials for AuthN's private endpoints. These will be used to execute admin actions using the
  # `Keratin.authn` client provided by this library.
  #
  # TIP: make them extra secure in production!
  config.username = 'hello' # 'secret'
  config.password = 'world' # 'secret'

  # OPTIONAL: enables debugging for the JWT verification process
  config.logger   = Rails.logger

  # OPTIONAL: Send private API calls to AuthN using private network routing. This can be necessary
  # if your environment has a firewall to limit public endpoints.
  config.authn_url = 'http://localhost:8080/'
end
