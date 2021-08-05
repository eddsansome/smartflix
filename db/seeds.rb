# frozen_string_literal: true

require 'faker'

100.times do
  CreateMovieWorker.perform_async(Faker::Movie.title)
end
