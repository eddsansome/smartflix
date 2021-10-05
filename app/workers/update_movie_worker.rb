class UpdateMovieWorker
    include Sidekiq::Worker
    sidekiq_options retry: false, queue: 'movies'
  
    # we should probably create a unit for this, seems a bit messy now
    def perform(title)
      sleep 1

      movie_params = GetMovie::ByTitle.call(title)
  
      return if movie_params.nil?
  
      slug = Slug::FromParams.call(movie_params)
      movie = Movie.where(slug: slug).first

      movie.update!(movie_params.merge(slug: slug))
    end
  end