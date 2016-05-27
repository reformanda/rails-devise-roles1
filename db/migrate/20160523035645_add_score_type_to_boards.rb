class AddScoreTypeToBoards < ActiveRecord::Migration
  def change
    add_reference :boards, :score_type, index: true
  end
end
