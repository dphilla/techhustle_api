Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root "docs#index"

namespace :api do
  namespace :v1 do
    resources :users, only: [:new, :create, :show, :index]
    resources :contacts
    resources :events, only: [:new, :create, :show, :index]
    resources :interactions
  end
end

end
