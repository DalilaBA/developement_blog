class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in? #make the variable accessible from the views also 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user #turning the variable to a boolean
  end

end
