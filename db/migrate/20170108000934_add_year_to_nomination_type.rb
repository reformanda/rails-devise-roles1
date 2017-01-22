class AddYearToNominationType < ActiveRecord::Migration
  def change
    add_column :nomination_types, :award_years_list, :text
  end
end
