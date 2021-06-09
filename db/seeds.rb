require 'faker'

# could change to csv / import

100.times do
  CreateMovieWorker.perform_async(Faker::Movie.title)
end

