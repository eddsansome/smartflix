class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: 'movies'

  def perform(title)
    sleep 1

    movie_params = GetMovie::ByTitle.call(title)

    Movie.create!(movie_params)
  end
end
