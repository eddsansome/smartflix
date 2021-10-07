class AddWritersToJoin < ActiveRecord::Migration[6.1]
  def change
    change_table :movie_writers do |t|
      t.belongs_to :movie
      t.belongs_to :writer
    end
  end
end
