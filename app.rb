require "bundler/setup"
require "sinatra"
require 'sinatra/cross_origin'
require "hypem"

configure do
  enable :cross_origin
end

set :port, 3001
set :environment, :production

get "/obsessed" do
  content_type :json
  user = Hypem.user(params[:username])
  user.obsessed_playlist.get.to_json
end

get "/mp3" do
  content_type :json
  Hypem::TrackMp3.new(params[:hypemId]).get.to_json
end

get "/user" do
  content_type :json
  user = Hypem.user(params[:username])
  user.obsessed_playlist.get
  user.to_json
end