class ChangeDateTypeForBoards < ActiveRecord::Migration
  def change
    change_column :boards, :start_date,  :string
    change_column :boards, :end_date,  :string
  end
end
