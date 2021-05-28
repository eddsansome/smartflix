class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: 'movies'

  def perform(movies)
    movies.each do |movie|
      Movie.create(title: movie[:title])
    end
  end
end
