class HighestScoreForBoardView2 < ActiveRecord::Migration
  def up
      execute <<-SQL

        CREATE OR REPLACE VIEW tmp2_highest_score_for_board_vw AS
        select  board_id, award_option_id, sum(score_total) as grand_total
        from tmp1_highest_score_for_board_vw
        group by award_option_id, nomination_id, board_id;

      SQL
  end

  def down
    execute <<-SQL

      DROP VIEW tmp2_highest_score_for_board_vw;

    SQL
  end
end
