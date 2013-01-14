class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :set_locale
	 
	def set_locale
		logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
		if params[:locale]
			I18n.locale= params[:locale]
		else
			I18n.locale = :fr
		end
		logger.debug "* Locale set to '#{I18n.locale}'"
	end

	def default_url_options(options={})
	  logger.debug "default_url_options is passed options: #{options.inspect}\n"
	  { :locale => I18n.locale }
	end
end
