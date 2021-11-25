class AddSlugIndexToMovies < ActiveRecord::Migration[6.1]
  def change
    add_index :movies, :slug
  end
end
