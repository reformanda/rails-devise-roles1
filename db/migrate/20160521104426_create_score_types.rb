class CreateScoreTypes < ActiveRecord::Migration
  def change
    create_table :score_types do |t|
        t.string :description
        t.text :instructions

        t.timestamps null: false
      end
  end
end
