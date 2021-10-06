class AddNameToDirector < ActiveRecord::Migration[6.1]
  def change
    add_column :directors, :name, :string

    add_reference :movies, :director, index: true
  end
end
