class MovieRating < ApplicationRecord
  belongs_to :movie

  def average_score
   ratings = [imdb_rating, meta_rating, tomato_rating].compact

   (ratings.sum / ratings.size).to_f.round(2)
  end
end
