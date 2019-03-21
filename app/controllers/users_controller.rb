class UsersController < ApplicationController

  get '/users/new' do
    erb :'/users/new'
  end

  get '/users/logout' do
    session.clear
    redirect to '/login'
  end

  get '/users/:id' do
    @user = Nomad.find(params[:id])
    @residences = @user.residences
    @loans=@user.nomad_to_roommate_loans
    @debts=@user.roommate_to_nomad_loans
    @karma=karma_calculator.upcase
    erb :'/users/show'
  end

  post '/users' do
    if !Nomad.find_by(:username => params[:username])
      @user=Nomad.create(:name => params[:name], :username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect to "/residences/new"
    else
      redirect to '/users/new'
    end
  end


end
