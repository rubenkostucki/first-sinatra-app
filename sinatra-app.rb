
require 'bundler/setup'
require 'sinatra'
require 'sinatra/contrib'
require 'erb'
require './lib/user'
require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/user")

# get '/' do
#   @user = [User.new("Aouled", "Miguil"), User.new("Ruben", "Kostucki")]
#   @user[0].special_skill = "Sleeping while Sleeping"
#   @user[1].special_skill = "Awake without looking like it"
#   erb :user_profiles
# end

get '/user-form' do
  # This will be your default route
  erb :form
end
