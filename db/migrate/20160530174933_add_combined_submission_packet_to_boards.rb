class AddCombinedSubmissionPacketToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :combined_submission_packet, :string
  end
end
