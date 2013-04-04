
require 'bundler/setup'
require 'sinatra'
require 'sinatra/contrib'
require 'erb'
require 'data_mapper'
require './lib/user'

DataMapper.setup(:default, "postgres://localhost/user")


DataMapper.finalize
DataMapper.auto_upgrade!

  get '/user-form' do
    erb :form
  end


  post '/users' do
    @user = User.create(
      :first_name      => params["firstname"],
      :last_name       => params["lastname"],
      :special_skill   => params["specialskill"],
      :created_at =>   Time.now

    )
    "Form Sent"
  end

  get '/users' do
    @users = User.all

    erb :user_profile

  end

  get '/edit-user/:id' do
    @user = User.get(params[:id])
    erb :edit_user
  end

  put '/edit-user/:id' do
    @user = User.update(
      :first_name      => params["firstname"],
      :last_name       => params["lastname"],
      :special_skill   => params["specialskill"],
      :created_at =>   Time.now

    )
    "User updated"
  end