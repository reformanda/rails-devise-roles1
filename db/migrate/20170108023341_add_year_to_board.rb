class AddYearToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :year, :string
  end
end
