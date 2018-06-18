class CreateMovieRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_ratings do |t|
    	t.references :user
    	t.references :movie
    	t.integer :ratings
      t.timestamps
    end
  end
end
