class AddNominationCntToBoards < ActiveRecord::Migration
  def change
        add_column :boards, :nomination_cnt, :integer
  end
end
