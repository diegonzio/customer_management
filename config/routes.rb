Rails.application.routes.draw do
	devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
	root 'home#index'
	resources :clients
	resources :positions
	resources :softwares
	resources :estates
end
