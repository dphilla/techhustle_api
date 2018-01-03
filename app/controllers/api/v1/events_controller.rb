class Api::V1::EventsController < ApplicationController

  def index
    render json: Event.all
  end

  def show
    render json: Event.find(params[:id])
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: "status 201"
    else
      response = "something went wrong"
    end
  end

    def event_params
      params.permit(:title, :start_time)
    end

end
