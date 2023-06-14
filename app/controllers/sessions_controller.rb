class SessionsController < ApplicationController
  def new
  end

  def create
    # find user and authenticate
    user = User.find_by(email: params[:email_or_username]) || User.find_by(username: params[:email_or_username])
    
    if user && user.authenticate(params[:password])
      # store user ID in hash
      session[:user_id] = user.id
      redirect_to user, notice: "Welcome back #{user.username}!"
    else
      flash.now[:alert] = "Incorrect email/password combination!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to movies_path, status: :see_other, notice: "You have signed out!"
  end
end
