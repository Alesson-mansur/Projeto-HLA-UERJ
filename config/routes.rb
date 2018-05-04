Rails.application.routes.draw do
  resources :relats
  resources :interprets
  resources :interps
  resources :eletroforeses
  resources :hibrids
  resources :pcrs
  resources :boardnums
  resources :reports
  resources :reagents
  resources :phases
  resources :boards
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :signatures
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'

  resources :dnanums
  resources :exams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
