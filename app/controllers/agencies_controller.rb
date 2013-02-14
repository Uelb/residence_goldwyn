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
			redirect_to agencies_sign_in_path, :alert => (:authentication_error) and return
		end
		@agency.stays << @stay
		render :summary
	end

	def summary
		@stay= Stay.find session[:stay_id]
	end

	def create
		@stay= Stay.find session[:stay_id]
		@agency= Agency.create(params[:agency])
		@agency.update_attribute("country", params[:country])
		redirect_to agencies_sign_in_path, :notice => t(:wait_for_activation)
	end

	def confirmation
		@stay= Stay.where(id: session[:stay_id]).first
		@agency= Agency.where(id: @stay.agency_id).first
		if @stay.nil? || @agency.nil?
			redirect_to agencies_sign_in_path, :alert => t(:error_occured) and return
		end
		AgencyMailer.reservation_confirmation(@agency).deliver
	end
end
