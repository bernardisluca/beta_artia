Rails.application.routes.draw do
  resources :activities do
    patch 'change_status'
  end
  resources :projects
  root 'home#index'
end
