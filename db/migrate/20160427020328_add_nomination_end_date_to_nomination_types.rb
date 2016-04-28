class AddNominationEndDateToNominationTypes < ActiveRecord::Migration
  def change
    add_column :nomination_types, :nomination_end_date, :datetime
  end
end
