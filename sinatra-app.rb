
require 'bundler/setup'
require 'sinatra'
require 'sinatra/contrib'
require 'erb'
require './lib/user'
require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/user")

class User
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :first_name,      String    # A varchar type string, for short strings
  property :last_name,       String      # A text block, for longer string data.
  property :special_skill,    Text # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.
end

DataMapper.finalize
User.auto_upgrade!

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

post '/profiles' do
  @user = User.create(
  :first_name      => "Phil",
  :last_name       => "Jones",
  :created_at => Time.now
)
  # erb :form
end

User.auto_migrate!

get '/profiles' do
  @user = User.find(params[:first_name])
  erb :user_profiles
end

