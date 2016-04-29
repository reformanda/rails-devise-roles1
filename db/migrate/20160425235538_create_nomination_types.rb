class CreateNominationTypes < ActiveRecord::Migration
  def change
    create_table :nomination_types do |t|
      t.string :year
      t.string :code
      t.string :description
      t.string :awards_announcement
      t.string :implementing_instructions
      t.string :submission_form
      t.string :award_narrative
      t.string :guidelines

      t.timestamps null: false
    end
  end
end
