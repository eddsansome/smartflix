require 'sidekiq-scheduler'

class CleanUpMovieWorker
  include Sidekiq::Worker

  def perform
    Movie.not_fresh.destroy_all
  end
end