class Users::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    summary_path
  end

  def after_inactive_sign_in_path_for(resource)
    summary_path  
  end
end