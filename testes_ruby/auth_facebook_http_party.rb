require 'httparty'

class AuthFacebookHttpParty
    include HTTParty

    base_uri "https://www.facebook.com/v2.8/dialog/oauth"

    def initialize
        @callback = "http://localhost:3000/auth_callback"
        @client_id = "1646129049129574"
    end

    def login!
        facebook_url = "#{self.class.base_uri}?client_id=#{@client_id}&redirect_uri=#{@callback}&response_type=code&scope=email"
        return facebook_url
    end
end