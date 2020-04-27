class SessionsController < ApplicationController

def new 
end

def create
     user = User.find_by(email: params[:session][:email].downcase)
     if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id 
      flash[:notice] = "Logged in Successfully"
      redirect_to user
     else
      # Always use flash[:notice] when our next step is redirect_to 
      # flash.now is to render the new template again.
      # As render is not a new request to the new page which simply display the name over again and not rederecting something new
      # if in this case we have use flash, the message would have set there even if the new request has been taken place 
      # say user redirect to some article page, the message wold be shown again then also.
      # So, flash.now will show only to the next http request and then disappears.
      flash.now[:alert] = " There something wrong with login details"
      render 'new'
     end  
end

def destroy 
  session[:user_id] = nil 
  flash[:notice] = "Logged Out"
  redirect_to root_path
end

end