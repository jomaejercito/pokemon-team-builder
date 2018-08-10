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
      erb :'teams/show'
    else
      redirect '/login'
    end
  end

end
