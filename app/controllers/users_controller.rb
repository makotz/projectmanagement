class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "Successfully Signed Up!"
    else
      render :new, alert: "Try again!"
    end
  end

  def edit
    current_user
  end

  def update
    current_user
    if @current_user.update user_params
      redirect_to root_path, notice: "Updated Successfully"
    else
      redirect_to edit_user_path(@current_user)
    end
  end

  def edit_password
    current_user
  end

  def update_password
    current_user
    if @current_user.authenticate(user_params[:current_password]) && @current_user.authenticate(user_params[:password]) == false
      @current_user.update(password: user_params[:password], password_confirmation: user_params[:password_confirmation])
      redirect_to root_path, notice: "Updated Successfully!"
    else
      render :edit_password, alert: "Try again!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
