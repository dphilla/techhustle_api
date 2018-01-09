class Api::V1::UsersController < ApplicationController

  before_action :current_user, except: :create

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
