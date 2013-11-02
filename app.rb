require "bundler/setup"
require "sinatra"
require "hypem"


get "/obsessed" do
  content_type :json
  user = Hypem.user(params[:username])
  user.obsessed_playlist.get.to_json
end
