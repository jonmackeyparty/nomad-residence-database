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
      if params[:residence][:deposit_refunded]=="true"
        residence.deposit_refunded=true
      end
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
      @deposit_status=deposit_status
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
    @residence=Residence.find(params[:id])
      if !params[:residence][:address].empty?
        @residence.address=params[:residence][:address]
      else
        erb :"/residences/#{@residence.id}"
      end

      if !params[:residence][:deposit].empty?
        @residence.deposit=params[:residence][:deposit]
      else
        erb :"/residences/#{@residence.id}"
      end

      if params[:residence][:primary_residence]=="true"
        @residence.primary_residence=true
      end

      if !params[:landlord][:name].empty?
        landlord=Landlord.find_by(:name => params[:landlord][:name])
          if !landlord
            @residence.landlord=Landlord.create(:name => params[:landlord][:name])
          else
            @residence.landlord=landlord
          end
      else
        @residence.landlord=Landlord.find(params[:landlord][:landlord_id].first)
      end

      if params[:roommate][:roommate_ids]
        params[:roommate][:roommate_ids].each do |id|
          roommate2=Roommate.find(id)
            if !@residence.roommates.include?(roommate2)
              @residence.roommates << roommate2
            end
        end
      end

      if !params[:roommate][:name].empty?
        roommate=Roommate.create(:name => params[:roommate][:name])
        @residence.roommates << roommate
      end

      @residence.save
      redirect to :"/residences/#{@residence.id}"
  end

  delete '/residences/:id' do
    if logged_in?
      @user=current_user
    residence = Residence.find(params[:id])
    residence.delete
    redirect to "/users/#{@user.id}"
    else
      erb :'login'
    end
  end

end
