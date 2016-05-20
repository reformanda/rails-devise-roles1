class AddSubmissionPacketToNomination < ActiveRecord::Migration
  def change
      add_column :nominations, :submission_packet, :string
  end
end
