class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new
    end
  end

  private
  def user_params
    params[:user].permit(:email, :password)
  end
end
