class AddTitleToNominationTypes < ActiveRecord::Migration
  def change
    add_column :nomination_types, :title, :string
  end
end
