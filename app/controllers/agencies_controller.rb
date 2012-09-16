class AgenciesController < ApplicationController

	def new
		@stay= Stay.find session[:stay_id]
		@agency= Agency.new
	end

	def sign_in
		@stay= Stay.find session[:stay_id]
	end

	def connect
		@stay= Stay.find session[:stay_id]
		@agency= Agency.where(params[:agency]).first
		if @agency.nil?
			redirect_to agencies_sign_in_path, :notice => "Identifiants incorrects" and return
		end
		@agency.stay += @stay
		render :summary
	end

	def summary
		@stay= Stay.find session[:stay_id]
	end

	def create
		@agency= Agency.create(params[:agency])
		@agency.update_attribute("country", params[:country])
	end
end
