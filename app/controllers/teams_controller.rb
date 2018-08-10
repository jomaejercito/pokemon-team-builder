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



end
