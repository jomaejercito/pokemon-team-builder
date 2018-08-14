class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/users'
    end
      erb :'/users/signup'
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    elsif !params[:email].match /@/
      redirect '/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect '/users'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/users'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/users'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/users' do
    if logged_in?
      erb :'/users/index'
    else
      redirect to '/login'
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    @teams = @user.teams
    if logged_in?
      erb :'/users/show'
    else
      redirect to '/login'
    end
  end


end
