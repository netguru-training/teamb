module ApplicationHelper
  def show_user_type
    return 'User' if current_user
    'Admin' if current_admin
  end
end
