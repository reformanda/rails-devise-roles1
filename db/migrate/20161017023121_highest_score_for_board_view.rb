class HighestScoreForBoardView < ActiveRecord::Migration
  def up
      execute <<-SQL

        CREATE OR REPLACE VIEW highest_score_for_board_vw AS
        select board_id, max(grand_total) grand_total
        from tmp2_highest_score_for_board_vw b group by b.board_id;
      SQL
  end

  def down
    execute <<-SQL
      DROP VIEW highest_score_for_board_vw;

    SQL
  end
end
