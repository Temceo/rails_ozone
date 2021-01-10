Rails.application.routes.draw do
  root 'home#index'
  # get 'home/zipcode'
  post "zipcode" => 'home#zipcode'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
