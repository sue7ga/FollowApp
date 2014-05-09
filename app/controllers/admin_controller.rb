class AdminController < ApplicationController
  include ApplicationHelper

  before_action :authorize
  
  def index    
   @micropost = Micropost.new
  end

  def show
   @user = current_user
   #@user = User.find_by(id: params[:id])  
   @microposts = @user.microposts  
   @followers = @user.followed_users
   @followers_ids = @followers.map(&:id)
   @follwers_microposts = Micropost.where(user_id: @followers_ids)
   #binding.pry
  end

  def destroy
   redirect_to controller: :sessions,action: :destroy
  end

 private 
 
  def authorize
    unless  User.find_by(id: session[:user_id])
     redirect_to controller: :sessions,action: :new
    end
  end

end
