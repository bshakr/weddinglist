class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :status => 200, :json => {
        auth_token: @user.auth_token,
        email: @user.email
      }
    else
      render :new
    end
  end

  private
  def user_params
    params[:user].permit(:email, :password)
  end
end
