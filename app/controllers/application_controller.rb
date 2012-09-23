class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :set_locale
	 
	def set_locale
		# available = %w{en fr}
		# pref_language= http_accept_language.preferred_language_from(available) # => 'fr or en'
		# I18n.locale = pref_language || I18n.default_locale
		I18n.locale= I18n.default_locale
	end

	def default_url_options(options={})
		logger.debug "default_url_options is passed options: #{options.inspect}\n"
		{ :locale => I18n.locale }
	end
end
