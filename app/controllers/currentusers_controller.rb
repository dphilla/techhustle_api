class CurrentusersController < ApplicationController

  def show
    render json: CurrentUser.last.current_user
  end

end
