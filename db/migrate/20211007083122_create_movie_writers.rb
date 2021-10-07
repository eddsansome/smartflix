class CreateMovieWriters < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_writers do |t|

      t.timestamps
    end
  end
end
