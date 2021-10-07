class RemoveActorColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :actors
  end
end
