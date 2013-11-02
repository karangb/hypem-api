require "bundler/setup"
require "sinatra"
require "hypem"


get "/obsessed" do
  content_type :json
  user = Hypem.user(params[:username])
  user.obsessed_playlist.get.to_json
end

get "/mp3" do
  content_type :json
  Hypem::TrackMp3.new(params[:hypemId]).get.to_json
end