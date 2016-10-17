class TieNominationsView < ActiveRecord::Base
  self.table_name = 'tie_nominations_board_vw'

  def readonly?
    true
  end

  def self.refresh
    ActiveRecord::Base.connection.execute('REFRESH MATERIALIZED VIEW tie_nominations_board_vw')
  end
end
