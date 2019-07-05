class SessionsController < ApplicationController

  layout 'login'

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    # method below
    redirect_user(user)
  end

  def destroy
    # method below
    log_out
    redirect_to root_path
  end

  ####################### END ROUTES #####################

end
