class AddRemoveTeamNameToNominationTypes < ActiveRecord::Migration
  def change
    add_column :nomination_types, :remove_team_name, :boolean
  end
end
