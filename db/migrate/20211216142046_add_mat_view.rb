class AddMatView < ActiveRecord::Migration[6.1]
  def change
      drop_view :top_movies
      create_view :top_movies, materialized: true
  end
end
