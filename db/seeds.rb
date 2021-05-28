require 'faker'

# could change to csv / import

movies = []

100.times do
  movies << {title: Faker::Movie.title}
end

CreateMovieWorker.perform_async(movies)
