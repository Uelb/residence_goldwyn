class Users::RegistrationsController < Devise::RegistrationsController
  
  def create
    super
  end

  def new
  	super
  end

  def after_sign_up_path_for(resource)
    summary_path
  end

  def after_inactive_sign_up_path_for(resource)
    summary_path
  end

  def after_sign_in_path_for(resource)
  	summary_path
	end

  def after_inactive_sign_in_path_for(resource)
    summary_path  
  end

  def after_update_path_for(resource)
    summary_path
  end
end