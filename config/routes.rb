Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'maps#show'
  get 'maps/google' => 'map#google', as: :google_map

  get 'sign_in' => 'sessions#new', as: :sign_in
post 'sign_in' => 'sessions#create'
delete 'sign_in' => 'sessions#delete'

get 'registration' => 'users#new', as: :new_user
post 'registration' => 'users#create', as: :create_user
end
