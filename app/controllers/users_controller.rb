class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/teams'
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
      redirect '/teams'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/teams'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/teams'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    @teams = @user.teams
    erb :'/users/show'
  end


end
