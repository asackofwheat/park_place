class UsersController < ApplicationController

  skip_before_action :require_login, :only => [:index, :new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "Created new user!"
      redirect_to @user
    else
      flash.now[:error] = "Failed to Create User!"
      render :new
    end
  end

  def show
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end

end
