class TieNominationBoardView < ActiveRecord::Migration
  def up
      execute <<-SQL
      create OR replace view tie_nominations_board_vw as
select a.* from tie_nominations_vw a inner join tie_board_vw b
where a.board_id=b.board_id and a.grand_total = b.grand_total

      SQL

  end

  def down
    execute <<-SQL
      DROP VIEW tie_nominations_board_vw
    SQL
  end
end
