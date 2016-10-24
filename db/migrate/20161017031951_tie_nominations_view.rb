class TieNominationsView < ActiveRecord::Migration
  def up
      execute <<-SQL
      create OR replace view tie_nominations_vw as
        select nomination_id, board_id, award_option_id, sum(score_total) as grand_total
        from tmp1_highest_score_for_board_vw a
       group by a.nomination_id, a.board_id, a.award_option_id
       order by grand_total desc;
      SQL

  end

  def down
    execute <<-SQL
      DROP VIEW tie_nominations_vw
    SQL
  end



end
