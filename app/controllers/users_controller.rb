class UsersController < ApplicationController
  
  def new
    @user= User.new
  end    
  
  def create
    User.new(params[:user])
  end
end
