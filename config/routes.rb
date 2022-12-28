Rails.application.routes.draw do
  resources :tests
  
  root "application#index"
end
