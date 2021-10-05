# frozen_string_literal: true

class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: 'movies'

  def perform(title)
    sleep 1

    movie_params = GetMovie::ByTitle.call(title)


    return if movie_params.nil?
    slug = Slug::FromParams.call(movie_params)
    Movie.create!(movie_params.merge(slug: slug))
  end
end
