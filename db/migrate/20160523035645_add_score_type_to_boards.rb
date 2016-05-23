class AddScoreTypeToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :score_type, :integer
  end
end
