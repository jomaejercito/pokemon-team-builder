class TeamsController < ApplicationController

  get '/teams' do
    if logged_in?
      erb :'teams/index'
    else
      redirect '/login'
    end
  end


end
