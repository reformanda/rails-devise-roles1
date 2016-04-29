class ChangeNominationEndDateToNominationTypes < ActiveRecord::Migration
  def up
    change_column :nomination_types, :nomination_end_date, :string
  end

  def down
    change_column :nomination_types, :nomination_end_date, :datetime
  end
end
