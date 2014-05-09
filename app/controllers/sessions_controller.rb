class SessionsController < ApplicationController
  include ApplicationHelper  

  def new
    
  end

  def create
   user = User.find_by(email: params[:session][:email])
   if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    current_user
    @user_id = session[:user_id]
    redirect_to admin_path(@user_id)
   else		
    render 'new' ,alert:"無効なユーザーです"
   end
  end

  def show
 
  end

  def destroy
    session[:user_id] = nil
    redirect_to controller: :sessions,action: :new
  end

end
