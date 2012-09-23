class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :set_locale
	 
	def set_locale
		logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
		if params[:locale]
			I18n.locale= params[:locale]
		else
			I18n.locale = extract_locale_from_accept_language_header
		end
		logger.debug "* Locale set to '#{I18n.locale}'"
	end

	def default_url_options(options={})
	  logger.debug "default_url_options is passed options: #{options.inspect}\n"
	  { :locale => I18n.locale }
	end

	private
	def extract_locale_from_accept_language_header
		logger.debug "#{http_accept_language.user_preferred_languages}"
		available = %w{en fr}
    	return http_accept_language.preferred_language_from(available)
	end

end
