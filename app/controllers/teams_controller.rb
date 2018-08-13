class TeamsController < ApplicationController

  get '/teams' do
    if logged_in?
      erb :'teams/index'
    else
      redirect '/login'
    end
  end

  get '/teams/new' do
    if logged_in?
      erb :'/teams/new'
    else
      redirect '/login'
    end
  end

  post '/teams' do
    @team = Team.create(params[:team])
    @team.user_id = current_user.id
    @team.save
    redirect '/teams'
  end

  get '/teams/:id' do
    if logged_in?
      @team = Team.find(params[:id])
      @user = current_user
      erb :'teams/show'
    else
      redirect '/login'
    end
  end

  get '/teams/:id/edit' do
    @team = Team.find(params[:id])
    if current_user.id == @team.user_id
      erb :'teams/edit'
    else
      redirect '/teams'
    end
  end

  patch '/teams/:id' do
    @team = Team.find(params[:id])
    if @team.user_id == current_user.id
      @team.update(params[:team])
      @team.save
      redirect "/teams/#{@team.id}"
    else
      redirect '/teams'
    end
  end

  delete '/teams/:id/delete' do
    @team = Team.find(params[:id])
    if @team.user_id == current_user.id
      @team.delete
      redirect '/teams'
    else
      redirect '/teams'
    end
  end

end
