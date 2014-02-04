class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  def create
    @user = login(params[:email], params[:password])

    if @user
      time_to_live = params[:ttl].blank? ? 31556940 :params[:ttl].to_i

      @user.regenerate_auth_token!(time_to_live.seconds.from_now) if @user.auth_token_expired?
      @user.device_token = params[:device_token]
      @user.save!
      render :status => 200, :json => {
        :email => @user.email,
        :auth_token => @user.auth_token,
        :auth_token_expires_at => @user.auth_token_expires_at
      }
    else
      render :status => 422, :json => { :error => "Invalid credentials" }
    end

  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end

end
