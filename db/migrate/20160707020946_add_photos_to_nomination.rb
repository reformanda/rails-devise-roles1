class AddPhotosToNomination < ActiveRecord::Migration
  def change
    add_column :nominations, :nominee_photograph_one, :string
    add_column :nominations, :nominee_photograph_two, :string
  end
end
