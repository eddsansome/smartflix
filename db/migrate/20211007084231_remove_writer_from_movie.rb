class RemoveWriterFromMovie < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :writer
  end
end
