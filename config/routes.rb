Rails.application.routes.draw do
  devise_for :users
  get 'static/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Set the default root link
  root to: 'static#index'
end
