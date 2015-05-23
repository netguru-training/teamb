module AdminsHelper

  def redirect_if_not_admin
     redirect_to root_path, notice: "You don't have permissions" unless admin_signed_in?
  end
  
end
