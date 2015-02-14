class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update] 
  before_action :admin_user,     only: [:destroy ]
  before_action :logged_in_user
    
  def new
     if current_user.admin == true 
        @user = User.new
     else
        
        flash[:danger] = "Registration section stricted to administrators."
         redirect_to home_path
     end 
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    #strong params method being used to initialize new user
    @user = User.new(user_params) 
      if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
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
      redirect_to root_path
    else
      # display edit page again
      render 'edit'
    end
  end
  
    def destroy 
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to root_path        
    end

    # strong parameters method to avoid SQL injection
    private
    def user_params
      # ensures only a set of values are permitted as parameters
      params.require(:user).permit(:name, :email, :password,
                     :password_confirmation)
    end
    
    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url            
        end 
    end
    
    def correct_user 
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user 
        redirect_to(root_url) unless current_user.admin?
    end

end
