class ChangeColumnTypeAndNameOfVoteFlag < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_review_votes, :vote_flag, :vote
    change_column :user_review_votes, :vote, :integer
  end
end
