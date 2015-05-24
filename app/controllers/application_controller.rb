class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :unless => :admin_sign_in?

private
  def admin_sign_in?
    current_admin
  end

  def check_if_match_unplayed
    if match.played?
      flash[:notice] = "Match was already played!"
      redirect_to matches_path
    end
  end

  def check_if_match_played
    if match.unplayed?
      flash[:notice] = "Match wasn't played!"
      redirect_to matches_path
    end
  end

end
