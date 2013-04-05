
require 'bundler/setup'
require 'sinatra'
require 'sinatra/contrib'
require 'erb'
require 'data_mapper'
require './lib/user'

DataMapper::Model.raise_on_save_failure = true
DataMapper.setup(:default, "postgres://localhost/user")


DataMapper.finalize
DataMapper.auto_upgrade!

  get '/user-form' do
    erb :form
  end


  post '/user-form' do
    @user = User.create(
      :first_name      => params["firstname"],
      :last_name       => params["lastname"],
      :special_skill   => params["specialskill"],
      :created_at      => Time.now
      )

      redirect "/user/#{@user.id}"
  end

    get '/user/:id' do
      # @user = User.get(params[:id])
      # erb :user
      params.inspect
    end

  post '/user/comments' do

    @comment = Comment.create(
      :text       => params["comments"],
      :created_at => Time.now
      )
  end

  get '/user/comments' do
     raise "here"
    @comments = Comment.all

    erb :user_comment
  end

  get '/users' do
    @users = User.all

    erb :all_users

  end

  get '/user-edit/:id' do
    @user = User.get(params[:id])
    if @user.nil?
     not_found
    end
    erb :edit_user
  end

  put '/user-edit/:id' do
    @user = User.get(params[:id])
    @user.update(
      :first_name      => params["firstname"],
      :last_name       => params["lastname"],
      :special_skill   => params["specialskill"],
      :created_at      => Time.now

    )
    "User updated"
  end

  delete '/user-edit/:id' do
    @user = User.get(params[:id])
    @user.destroy

    "User deleted"
  end

    not_found do
      status 404
      "Oopsy Daisy ... this user has been deleted by"
      # erb :not_found
    end