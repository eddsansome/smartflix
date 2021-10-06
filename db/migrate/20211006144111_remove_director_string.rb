class RemoveDirectorString < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :director
  end
end
