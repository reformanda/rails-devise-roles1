class AddNominationTypesListToUser < ActiveRecord::Migration
  def change
    add_column :users, :nomination_types_list, :text  
  end
end
