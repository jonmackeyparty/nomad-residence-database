class LoansController < ApplicationController

  get '/loans' do
    if logged_in?
      @user=current_user
      erb :'/loans/show'
    else
      erb :'login'
    end
  end


  patch '/loans/:id' do
    @user=current_user
    @roommate=Roommate.find(params[:id])
      if !params[:loan][:line_item].empty? && !params[:loan][:amount].empty?
        loan=NomadToRoommateLoan.create(:date => Time.now, :nomad_id => @user.id, :roommate_id => @roommate.id)
        loan.line_item=params[:loan][:line_item]
        loan.amount=params[:loan][:amount].to_i
        loan.save
      else
      end
      if !params[:debt][:line_item].empty? && !params[:debt][:amount].empty?
        debt=RoommateToNomadLoan.create(:date => Time.now, :nomad_id => @user.id, :roommate_id => @roommate.id)
        debt.line_item=params[:debt][:line_item]
        debt.amount=params[:debt][:amount].to_i
        debt.save
      else
      end
    erb :'/loans/show'
  end


  get '/loans/:id/edit' do
    if logged_in?
      @user=current_user
      @roommate=Roommate.find(params[:id])
      @debts=@roommate.roommate_to_nomad_loans
      @loans=@roommate.nomad_to_roommate_loans
      if @debts.empty?
        @debts="0"
      end
      if @loans.empty?
        @loans="0"
      end
      erb :'/loans/edit'
    else
      erb :'login'
    end
  end

  delete '/loans/:id' do
    if logged_in?
      @user=current_user
    loan = NomadToRoommateLoan.find(params[:id])
    loan.delete
    erb :'/loans/show'
    else
      erb :'login'
    end
  end

  delete '/debts/:id' do
    if logged_in?
      @user=current_user
    debt = RoommateToNomadLoan.find(params[:id])
    debt.delete
    erb :'/loans/show'
    else
      erb :'login'
    end
  end



end
