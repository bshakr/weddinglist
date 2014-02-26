class GuestsController < ApplicationController
  respond_to :json
  before_filter :require_auth
  skip_before_filter :verify_authenticity_token

  def index
    respond_with Guest.all
  end

  def create
    respond_with Guest.create(guest_params)
  end


  private

  def guest_params
    params.require(:guest).permit(:name, :number_of_guests, :reception, :international, :inviter)
  end
end