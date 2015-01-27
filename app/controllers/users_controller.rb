class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    #strong params method being used to initialize new user
    @user = User.new(user_params) 
    if @user.save
      # Log in user after being created 
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      # redirect to user show page
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    # Find user by Id to be used to update user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params) #updates user and returns true/false
      # handle succesfull update
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      # display edit page again
      render 'edit'
    end
  end


    # strong parameters method to avoid SQL injection
    private
    def user_params
      # ensures only a set of values are permitted as parameters
      params.require(:user).permit(:name, :email, :password,
                     :password_confirmation)
    end

end
