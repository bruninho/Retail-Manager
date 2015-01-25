class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end 

  	def new
  		@user = User.new
  	end

  	def create
  		@user = User.new(user_params)
  		if @user.save
  			flash[:success] = "Welcome to Retail Manager!"
  			redirect_to @user
  		else
  			render 'new'
  		end 
  	end

  	private
  	def user_params
  		# ensures only a set of values are permitted as parameters
	  	params.require(:user).permit(:name, :email, :password,
	  								 :password_confirmation)
	end 
end
