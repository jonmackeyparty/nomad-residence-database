require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'nomad'
  end

  get '/' do
    if logged_in?
      user = current_user
      redirect to "/users/#{user.id}"
    end
      erb :'index'
  end

  get '/login' do
    if logged_in?
      user = current_user
      redirect to "/users/#{user.id}"
    else
      erb :'login'
    end
  end

  post '/login' do
    @user=Nomad.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect to "/users/#{@user.id}"
    end
    redirect '/login'
  end

  helpers do
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    Nomad.find(session[:user_id])
  end

  def current_address
    current_user.residences.find_by(:primary_residence => true)
  end

end


end
