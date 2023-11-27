require_relative 'auth_facebook_http_party'

auth = AuthFacebookHttpParty.new
puts auth.login!

User.create(token_facebook: codigo)