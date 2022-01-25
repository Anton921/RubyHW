class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :set_cookies
  after_action :set_cookies

  helper_method :current_author
  helper_method :logged_in?

  def set_cookies
    if cookies[:not_in] == nil
      cookies[:not_in] = 0
    end
  end

  def not_in
    if !logged_in?
      cook = cookies[:not_in].to_i
      cook += 1
      cookies[:not_in] = cook
    end
  end

  def logged_in?
    !current_author.nil?
  end
  
  private
  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end
end
