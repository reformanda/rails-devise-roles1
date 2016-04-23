class CreateNominationTypes < ActiveRecord::Migration
  def change
    create_table :nomination_types do |t|
      t.string :code
      t.string :description

      t.timestamps null: false
    end
  end
end
