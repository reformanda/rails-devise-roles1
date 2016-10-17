class TieBoardView < ActiveRecord::Migration
  def up
      execute <<-SQL
      create OR replace view tie_board_vw as
        select a.board_id, a.grand_total
        from highest_score_for_board_vw a
        join all_scores_for_board_vw b
        on a.board_id=b.board_id and a.grand_total=b.grand_total

      SQL

  end

  def down
    execute <<-SQL
      DROP VIEW tie_board_vw
    SQL
  end
end
