class CreateUserReviewVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_review_votes do |t|
      t.boolean :vote_flag
      t.references :user_review
      t.references :user
      t.timestamps
    end
  end
end
