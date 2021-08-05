class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: 'movies'

  def perform(title)
    sleep 1

    movie_params = GetMovie::ByTitle.call(title)

    return if movie_params.nil?

    Movie.create!(movie_params)
  end
end
