class HighestScoreForBoardView1 < ActiveRecord::Migration
  def up
      execute <<-SQL
        CREATE OR REPLACE VIEW tmp1_highest_score_for_board_vw AS
        select nomination_id, award_option_id, board_id, score_total from scores a
        inner join nominations b on b.id=a.nomination_id;
      SQL
  end

  def down
    execute <<-SQL
      DROP VIEW tmp1_highest_score_for_board_vw;
    SQL
  end
end
