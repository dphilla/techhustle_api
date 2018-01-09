class Api::V1::ContactsController < ApplicationController

  before_action :current_user

  def index
    @contacts = @current_user.contacts.all
    render json: @contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: "status 201"
    else
     response = "failed to create an item"
    end
  end

  def show
    render json: @current_user.contacts.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: "status 201"
    else
      response = "Failed to update item"
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
  end

  def contact_params
    params.permit(:first_name, :last_name, :initial_meet, :organization, :relationship)
  end



end
