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
      @user = current_user
      redirect to "/users/#{@user.id}"
    end
      erb :'index'
  end

  get '/login' do
    if logged_in?
      @user = current_user
      redirect to "/users/#{@user.id}"
    else
      erb :'login'
    end
  end

  post '/login' do
    if !params[:username].empty? && !params[:password].empty?
      @user=Nomad.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/users/#{@user.id}"
      end
    else
      redirect '/login'
    end
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

  def deposit_status
    @residence.deposit_refunded==true ? "Yes" : "No"
  end

  def karma_calculator
    ingress=[0]
    egress=[0]
    current_user.residences.each do |residence|
      residence.roommates.each do |roommate|
        roommate.nomad_to_roommate_loans.each do |loan|
          ingress << loan.amount
        end
      end
    end
    current_user.residences.each do |residence|
      residence.roommates.each do |roommate|
        roommate.roommate_to_nomad_loans.each do |loan|
          egress << loan.amount
        end
      end
    end
    karma=ingress.reduce(:+) - egress.reduce(:+)
      if karma > 0
          "Angelic"
        elsif karma < 0
          "Wack"
        else
          "Neutral"
        end
      end
    end

end
