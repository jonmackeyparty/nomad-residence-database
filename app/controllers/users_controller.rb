class UsersController < ApplicationController

  get '/users/new' do
    if logged_in?
      @user=current_user
      redirect to "/users/#{@user.id}"
    else
      erb :'/users/new'
    end
  end

  get '/users/logout' do
    session.clear
    redirect to '/login'
  end

  get '/users/:id' do
    if logged_in? 
      @user = current_user
      @residences = @user.residences
      @loans=@user.nomad_to_roommate_loans
      @debts=@user.roommate_to_nomad_loans
      @karma=karma_calculator.upcase
      erb :'/users/show'
    else
      flash[:notice] = "You must be logged in to do this.  Please log in."
      erb :'login'
    end
  end

  post '/users' do
    if !params[:username].empty? && !params[:name].empty? && !params[:password].empty?
      if !Nomad.find_by(:username => params[:username])
        @user=Nomad.create(:name => params[:name], :username => params[:username], :password => params[:password])
        session[:user_id] = @user.id
        redirect to "/residences/new"
      else
        redirect to '/login'
      end
    else
      flash[:notice] = "Please ensure that all forms are filled in."
      redirect to '/users/new'
    end
  end

end
