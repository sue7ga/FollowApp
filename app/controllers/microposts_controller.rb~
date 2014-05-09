class MicropostsController < ApplicationController

 def create
  @micropost = Micropost.new(micropost_params)
  @user = User.find_by(id: session[:user_id])
  @micropost.user_id = @user.id
  if @micropost.save  
   @microposts = @user.microposts
   render action: 'show'
  else
   redirect_to controller: :users,action: :new
  end
 end

 def show
   @user = User.find_by(id: session[:user_id])
   @microposts = @user.microposts
 end

 private 

   def micropost_params
     params.require(:micropost).permit(:content,:user_id)
   end

end
