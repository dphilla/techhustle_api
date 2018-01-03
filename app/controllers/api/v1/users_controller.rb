class Api::V1::UsersController < ApplicationController

  def create
    #this should be done from Linkedin Login
  end

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

end
