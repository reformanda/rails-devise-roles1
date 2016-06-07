class AddCommentsToScores < ActiveRecord::Migration
  def change
    add_column :scores, :score_comments, :text
  end
end
