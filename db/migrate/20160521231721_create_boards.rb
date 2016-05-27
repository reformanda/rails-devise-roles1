class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.references :nomination_type, index: true, foreign_key: true
      t.references :score_type, index: true, foreign_key: true
      t.text :users_list
      t.timestamps null: false
    end
  end
end
