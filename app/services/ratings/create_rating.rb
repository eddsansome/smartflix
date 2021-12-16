module Ratings
  module CreateRating
    class Action < ApplicationService
      def initialize(ratings, movie)
        @ratings = ratings
        @model = movie
      end

      def call
        model.movie_ratings.create!(ratings)
      end

      private

      attr_reader :model, :ratings
    end
  end
end