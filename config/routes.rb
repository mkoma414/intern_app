Rails.application.routes.draw do

  root 'projects#index'

  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :projects do
    collection do
      get :get_head_data
    end
  end

  resources :companies, only: [:edit, :update]

end
