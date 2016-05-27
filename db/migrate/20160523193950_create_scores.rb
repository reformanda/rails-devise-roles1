class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :board_id
      t.integer :nomination_id
      t.integer :score_1
      t.integer :score_2
      t.integer :score_3
      t.integer :score_4
      t.integer :score_5
      t.integer :score_6
      t.integer :score_7
      t.integer :score_8
      t.integer :score_9
      t.integer :score_total
    end
  end
end
