class CurrentUser < ApplicationRecord


  def self.set_current_user(id)
    create(current_user: id)
  end

end
