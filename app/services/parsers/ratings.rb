# frozen_string_literal: true

module Parsers
  module Ratings

    class << self
    def call(http_object)
      flatten_ratings(http_object)
    end

    def flatten_ratings(http_object)
      tomato_score = extract_tomato_score(http_object)
      meta_score = extract_meta_score(http_object)
      imdb_score = extract_imdb_score(http_object)
      avg_score = average_rating(tomato_score, meta_score, imdb_score)

      ratings = { ratings: {tomato_rating: tomato_score, meta_rating: meta_score, imdb_rating: imdb_score, average_rating: avg_score} }
      http_object.delete("Ratings")
      http_object.merge!(ratings)
      http_object
    end

    def average_rating(*args) 
      ratings = args.compact
   
      (ratings.sum / ratings.size).to_f.round(2)
     end

    def extract_imdb_score(http_object)
      score = http_object["imdbRating"]&.to_f
      http_object.delete("imdbRating")

      score
    end

    def extract_meta_score(http_object)
      score = http_object["Metascore"]&.to_i
      http_object.delete("Metascore")

      return if score.nil?

      score / 10.0
    end


    def extract_tomato_score(http_object)
      score = http_object["Ratings"]&.select {|rating| rating['Source'] == "Rotten Tomatoes"}
      &.first
      &.fetch("Value")
      &.split("%")
      &.first
      &.to_i

      return if score.nil?

      score / 10.0
    end
  end
end
end
