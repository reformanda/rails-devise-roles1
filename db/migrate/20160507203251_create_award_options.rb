class CreateAwardOptions < ActiveRecord::Migration
  def change
    create_table :award_options do |t|
      t.string :name
      t.references :nomination_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
