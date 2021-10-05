# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' # show the sidekiq web UI
  get '/movies/:title' => 'movies#show'
  get '/movies' => 'movies#index'
end
