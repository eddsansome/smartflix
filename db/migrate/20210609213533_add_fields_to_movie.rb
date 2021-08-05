# frozen_string_literal: true

class AddFieldsToMovie < ActiveRecord::Migration[6.1]
  def change
    change_table :movies do |t|
      t.integer :year
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :writer
      t.string :actors
      t.string :plot
      t.string :language
      t.string :country
      t.string :awards
      t.string :poster
      t.float :metascore
      t.float :imdbrating
      t.string :imdbvotes
      t.string :imdbid
      t.string :type
      t.string :dvd
      t.string :boxoffice
      t.string :production
      t.string :website
    end
  end
end
