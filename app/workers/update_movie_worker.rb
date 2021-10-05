# frozen_string_literal: true

class UpdateMovieWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: 'movies'

  def perform(title)
    sleep 1
    UpdateMovie::Action.call(title)
  end
end
