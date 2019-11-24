class SessionsController < ApplicationController
  def new
  end
  def create
    if logged_in?
      redirect_to tasks_path
      else
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
          if user.admin?
          redirect_to admin_users_path
          flash[:notice] = 'welcome on ur page of admin'
           else
      redirect_to tasks_path
      flash[:notice] = 'welcome on ur user page'
          end
    else
      render 'new'
      flash[:notice] = 'Failed to login'
    end  
  end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You logged out'
    redirect_to new_session_path
  end
end
