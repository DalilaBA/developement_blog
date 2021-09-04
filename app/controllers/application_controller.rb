class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in? #make the variable accessible from the views also 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user #turning the variable to a boolean
  end

  def reqire_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  def require_own_user
    if current_user !=@article.user
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end
  


end
