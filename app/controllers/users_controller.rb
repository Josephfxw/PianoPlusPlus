class UsersController < ApplicationController
	def new
	  @user = User.new
	end

	def create 
	  @user = User.new(user_params)
	  @user.istutor = false
	  @user.isstudent = true
	  if @user.save 
	    session[:user_id] = @user.id 
	    redirect_to '/' 
	  else 
	    redirect_to '/signup' 
	  end 
	end

	def show
	end

	def index
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :username, :email, :password,
			:istutor, :isstudent, :description)
	end
end
