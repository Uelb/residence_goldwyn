#encoding: utf-8

class AgenciesController < ApplicationController

	def new
		@stay= Stay.find session[:stay_id]
	end

	def create
		@stay= Stay.find session[:stay_id]
		email= params[:agency][:email]
		agency_hash= params[:agency]
		agency_hash.delete_if do |key,value|
			key == "email"
		end
		agency= Agency.where(agency_hash).first
		if agency.nil?
			redirect_to new_agency_path, :notice => "Une erreur s'est produite. Veuillez vérifier vos identifiants" and return
		else
			agency.update_attribute("email", email)
			@stay.update_attribute("agency_id", agency.id)
			redirect_to pro_path
		end
	end
end
