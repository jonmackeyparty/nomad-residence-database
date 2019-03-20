class ResidencesController < ApplicationController

  get '/residences/new' do
    if logged_in?
      @user = current_user
      erb :'/residences/new'
    else
      erb :'login'
    end
  end

  post '/residences' do
    @user = current_user
    residence = Residence.create(:address => params[:residence][:address], :deposit => params[:residence][:deposit].to_i)
      if params[:residence][:primary_residence] == "true"
        residence.primary_residence=true
      end
      if !params[:landlord][:name].empty?
        landlord = Landlord.create(:name => params[:landlord][:name])
      else
        landlord = Landlord.find(params[:landlord_id])
      end
    residence.landlord = landlord
      if !params[:roommate][:name].empty?
        roommate = Roommate.create(:name => params[:roommate][:name])
      else
        roommate = Roommate.find_by(:name => params[:roommate][:name])
      end
    residence.roommates << roommate
    residence.save
    @user.residences << residence
    redirect to "/users/#{@user.id}"
  end

  get '/residences/:id' do
    if logged_in?
      @user=current_user
      @residence=@user.residences.find(params[:id])
      @deposit_status=
      erb :'residences/show'
    else
      erb :'login'
    end
  end

  get '/residences/:id/edit' do
    if logged_in?
      @user=current_user
      @residence=@user.residences.find(params[:id])
      erb :'residences/edit'
    else
      erb :'login'
    end
  end

  patch '/residences/:id' do

  end

end
