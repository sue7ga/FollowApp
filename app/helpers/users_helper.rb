module UsersHelper
  
 def current_user
   @current_user = User.find_by(id: session[:id])
 end


end
