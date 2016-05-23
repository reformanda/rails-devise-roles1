class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :board_id
      t.integer :nomination_id
      t.integer :score_num
      t.string :score_txt
      t.text :score_comments
      t.float :score
    end
  end
end
