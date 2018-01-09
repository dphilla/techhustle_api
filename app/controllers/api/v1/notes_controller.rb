
class Api::V1::NotesController < ApplicationController

  before_action :current_user

  def index
    render json: Note.all
  end

  def create
    note = Note.new(note_params)
    if note.save
      render json: "status 201"
    else
     response = "failed to create an item"
    end
  end

  def show
     render json: Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    if note.update(note_params)
      render json: "status 201"
    else
      response = "Failed to update item"
    end
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
  end

  def note_params
    params.permit(:content, :date, :contact_id)
  end



end
