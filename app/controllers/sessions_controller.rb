class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
          if user.adminb?
          redirect_to admin_users_path
          flash[:notice] = 'welcome on ur page of admin'
           else
      redirect_to tasks_path
      flash[:notice] = 'welcome on ur user page'
          end
    elsif
      redirect_to new_session_path
        flash[:notice] = 'pls login '
    else
      flash[:notice] = 'Failed to login'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You logged out'
    redirect_to new_session_path
  end
end
