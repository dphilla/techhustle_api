class Api::V1::InteractionsController < ApplicationController

  #how are you going to check for current user?
  before_action :current_user

  def index
    render json: Interaction.all
  end

  def show
    render json: Interaction.find(params[:id])
  end

  def create
    interaction = Interaction.new(interaction_params)
    if interaction.save
      render json: "status 201"
    else
      response = "something went wrong"
    end
  end

  def update
    interaction = Interaction.find(params[:id])
    if interaction.update(interaction_params)
      render json: "status 201"
    else
      response = "something went wrong"
    end
  end

  def destroy
    interaction = Interaction.find(params[:id])
    interaction.destroy
  end

    def interaction_params
      params.permit(:date, :location, :event, :description, :contact_id)
    end

end
