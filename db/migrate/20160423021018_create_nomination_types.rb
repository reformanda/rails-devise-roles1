class CreateNominationTypes < ActiveRecord::Migration
  def change
    create_table :nomination_types do |t|
      t.string :code
      t.string :description
      t.string :awards_announcement
      t.string :implementing_instructions
      t.string :submission_form_and_award_narrative
      t.string :award_narrative_sample
      t.string :guidelines_and_tips
      t.timestamps null: false
    end
  end
end
