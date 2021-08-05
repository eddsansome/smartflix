# frozen_string_literal: true

class RenameMovieType < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :type
    add_column :movies, :movie_type, :string
  end
end
