#OmniAuth.config.full_host = 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
#  require 'openid/store/filesystem'
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
#    {
#        :client_options => {
#          :site => 'https://localhost:3000/api/v3',
#          :authorize_url => 'https://localhost:3000/login/oauth/authorize',
#          :token_url => 'https://localhost:3000/login/oauth/access_token',
#        }
#      }
#  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp')
end
