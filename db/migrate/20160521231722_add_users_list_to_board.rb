class AddUsersListToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :users_list, :text
  end
end
