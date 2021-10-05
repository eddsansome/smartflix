require 'sidekiq-scheduler'

class BatchUpdateMoviesWorker
    include Sidekiq::Worker
    sidekiq_options retry: false, queue: 'movies'
  
    # we should probably create a unit for this, seems a bit messy now
    def perform
      movies = Movie.all

      movies.each do |movie|
        UpdateMovieWorker.perform_async(movie.title)
      end
    end
  end
  