Rails.application.routes.draw do
 resources :glams
  resources :artists do
    resources :glams 
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
