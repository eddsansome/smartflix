class CreateMovieRatings < ActiveRecord::Migration[6.1]
  def change
    # lets move the ratings to their own table
    remove_column :movies, :imdbrating

    create_table :movie_ratings do |t|
      t.references :movie, null: false, foreign_key: true
      t.float :imdb_rating
      t.float :meta_rating
      t.float :tomato_rating

      t.timestamps
    end
  end
end
