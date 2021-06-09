require_relative "../../services/get_movie"

class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: 'movies'

  def perform(title)
  sleep 5

  movie_getter = Services::GetMovie.new

  movie = movie_getter.by_title(title)

  Movie.create({
    title: movie.title,
    year: movie.year,
    rated: movie.rated,
    released: movie.released,
    runtime: movie.runtime,
    genre: movie.genre,
    director: movie.director,
    writer: movie.writer,
    # update this when we have actor model, here we convert to 
    # a string, but we cast to array in the parser :smart_guy
    actors: movie.actors.join,
    plot: movie.plot,
    language: movie.language,
    country: movie.country,
    awards: movie.awards,
    poster: movie.poster,
    metascore: movie.metascore,
    imdbrating: movie.imdbrating,
    imdbvotes: movie.imdbvotes,
    imdbid: movie.imdbid,
    # name clash - rename!
    # type: movie.type,
    dvd: movie.dvd,
    boxoffice: movie.boxoffice,
    production: movie.production,
    website: movie.website
  })
  end
end
