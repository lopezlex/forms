class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # fail
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable__entity
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
