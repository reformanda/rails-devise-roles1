class AddStatusToNomination < ActiveRecord::Migration
  def change
    add_column :nominations, :status, :integer
  end
end
