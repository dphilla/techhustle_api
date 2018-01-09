class ApplicationController < ActionController::API


    def current_user
      user_id = params["current_user"].to_i
      @current_user = User.find(user_id) if CurrentUser.last.id == user_id
    end

end
