class AddMonetaryAwdToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :monetary_awd, :string
  end
end
