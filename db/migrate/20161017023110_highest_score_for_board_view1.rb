class HighestScoreForBoardView1 < ActiveRecord::Migration
  def up
      execute <<-SQL
        CREATE OR REPLACE VIEW tmp1_highest_score_for_board_vw AS
        select nomination_id, board_id, score_total from scores;
      SQL
  end

  def down
    execute <<-SQL
      DROP VIEW tmp1_highest_score_for_board_vw;
    SQL
  end
end
