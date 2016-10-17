class AllScoresForBoardView < ActiveRecord::Migration

    def up
        execute <<-SQL
        create OR replace view all_scores_for_board_vw as
          select board_id, grand_total
          from
          tmp2_highest_score_for_board_vw c
        group by board_id, grand_total having count(*) > 1

        SQL

    end

    def down
      execute <<-SQL
        DROP VIEW all_scores_for_board_vw
      SQL
    end


end
