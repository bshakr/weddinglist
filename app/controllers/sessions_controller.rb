class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create, :destroy]

  def create
    unless valid_params?
      render status: 422, json: { errorMessage: "Missing username or password" }
      return
    end
    @user = login(user_params[:email], user_params[:password])
    Rails.logger.info "is user nil? #{@user.nil?}"
    if @user.nil?
      render status: 422, json: { errorMessage: "Invalid credentials" }
      return
    end

    @user.regenerate_auth_token!(31556940) if @user.auth_token_expired?
    @user.save!

    render status: 200, json: {
      auth_token: @user.auth_token,
      email: @user.email,
    }
  end

  def destroy
    logout
    render :status => 200, json: {}
  end

  private
  def valid_params?
    [:email, :password].all? { |k| user_params.key? k }
  end

  def user_params
    params.require(:user).permit(:email, :password, :auth_token)
  end
end
