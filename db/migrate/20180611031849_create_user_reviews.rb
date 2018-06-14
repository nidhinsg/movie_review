class CreateUserReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reviews do |t|
      t.text :review_comment
      t.references :user
      t.references :movie
      t.timestamps
    end
  end
end
