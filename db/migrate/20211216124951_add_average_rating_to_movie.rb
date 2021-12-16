class AddAverageRatingToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movie_ratings, :average_rating, :float
  end
end
