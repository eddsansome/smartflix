# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' # show the sidekiq web UI

  root 'movies#index'
  get '/movies/:title' => 'movies#show'
  resources :movies, except: :show
  resources :actors, only: :show
  resources :writers, only: :show
  resources :directors, only: :show
end
