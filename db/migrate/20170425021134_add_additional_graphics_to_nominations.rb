class AddAdditionalGraphicsToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :additional_supporting_graphics, :string
  end
end
