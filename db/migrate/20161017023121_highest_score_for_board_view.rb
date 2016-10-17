class HighestScoreForBoardView < ActiveRecord::Migration
  def up
      execute <<-SQL
        CREATE OR REPLACE VIEW highest_score_for_board_vw AS
        select board_id, max(grand_total) grand_total
        from
        (select  board_id, sum(score_total) as grand_total from (select nomination_id, board_id, score_total from scores) a
        group by a.nomination_id, a.board_id) b group by b.board_id;
      SQL

  end

  def down
    execute <<-SQL
      DROP VIEW highest_score_for_board_vw
    SQL
  end
end
