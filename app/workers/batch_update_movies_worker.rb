require 'sidekiq-scheduler'

class BatchUpdateMoviesWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: 'movies'

  def perform
    movies = Movie.all

    movies.each do |movie|
      UpdateMovieWorker.perform_async(movie.title)
    end
  end
end
