class SessionsController < ApplicationController
  def new
    # renderöi kirjautumissivun
  end

  def create
    user = User.find_by username: params[:username]

	

    if user && user.authenticate(params[:password])
      if user.account_frozen
	  redirect_to :back, notice: "Your account is frozen, please contact an administrator"
	  return
	end
	  session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back!"
    else
      redirect_to :back, notice: "Username and/or password mismatch"
    end
  end

  def destroy
    # nollataan sessio
    session[:user_id] = nil
    # uudelleenohjataan sovellus pääsivulle
    redirect_to :root
  end

  def create_oauth
	byebug
  end
end
