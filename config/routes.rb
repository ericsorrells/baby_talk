Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/about'
  get 'events/index'
  get 'events/show_events'
  resources :users
  resources :sessions, only:  [:new, :create, :destroy]
  resources :questions, only: [:index, :show, :edit]
  resources :answers
  resources :babies
  resources :notifications
  post 'notifications/notify', to: 'notifications#notify'
  post 'notifications/send_text_message', to: 'notifications#send_text_message'
  match '/signup',  to: 'users#new', via: 'get'
  match '/signin',  to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  get '/.well-known/acme-challenge/:id' => 'statis_pages#letsencrypt'
end
