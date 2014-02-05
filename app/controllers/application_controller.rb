class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def require_auth
    auth_token = request.headers["Authorization"]
    Rails.logger.info "auth token #{auth_token}"
    @user = User.find_by_auth_token(auth_token)
    if @user
      if @user.auth_token_expired?
        render :status => 401, :json => { :error => "Auth token expired" }
        return false
      end
    else
      render :status => 401, :json => { :error => "Requires authorization" }
      return false
    end
  end
  private


end
