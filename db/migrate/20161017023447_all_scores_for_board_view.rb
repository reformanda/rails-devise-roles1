class AllScoresForBoardView < ActiveRecord::Migration

    def up
        execute <<-SQL
        create OR replace view all_scores_for_board_vw as
          select board_id, grand_total
          from
            (select  board_id, sum(score_total) as grand_total
            from
              (select nomination_id, board_id, score_total from scores) c
          group by c.nomination_id, c.board_id) d
        group by board_id, grand_total having count(*) > 1

        SQL

    end

    def down
      execute <<-SQL
        DROP VIEW all_scores_for_board_vw
      SQL
    end


end
