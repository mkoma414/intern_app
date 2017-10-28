Rails.application.routes.draw do

  devise_for :companies
  devise_for :users

  resources :projects

end
