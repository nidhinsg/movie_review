class AddColumnDescriptionToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :description, :text
    add_column :movies, :type, :string
    add_column :movies, :director, :string
    add_column :movies, :producer, :string
    add_column :movies, :released_date, :datetime
  end
end
