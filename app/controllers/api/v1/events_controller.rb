class Api::V1::EventsController < ApplicationController

  before_action :current_user

  def index
    render json: @current_user.events.all
  end

  def show
    render json: @current_user.events.find(params[:id])
  end

  def create
    event = Event.new(title: params[:title], start_time: params[:start_time], location: params[:location], user_id: @current_user.id)

    if event.save
      #event.update(user_id: @current_user.id)
      render json: "status 201"
    else
      response = "something went wrong"
    end
  end

    def event_params
      #params.permit(:title, :start_time, :location)
    end

end
