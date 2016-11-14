Rails.application.routes.draw do

  devise_for :users
  resources :campaigns do
    resources :pledges, only: [ 'create','new', 'show']
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
