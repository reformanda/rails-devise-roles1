class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.string :ucho_title
      t.string :ucho_first
      t.string :ucho_last
      t.string :ucho_suffix
      t.string :ucho_phone
      t.string :ucho_email
      t.string :ucho_organization
      t.string :nomoff_title
      t.string :nomoff_first
      t.string :nomoff_last
      t.string :nomoff_suffix
      t.string :nomoff_phone
      t.string :nomoff_email
      t.string :poc_title
      t.string :poc_first
      t.string :poc_last
      t.string :poc_suffix
      t.string :poc_phone
      t.string :poc_email
      t.string :poc_org_address_1
      t.string :poc_org_address_2
      t.string :poc_city
      t.string :poc_state
      t.string :poc_zip
      t.string :poc_country
      t.string :award
      t.string :nominee_title
      t.string :nominee_first
      t.string :nominee_last
      t.string :nominee_suffix
      t.string :nominee_position_title
      t.string :nominee_email
      t.string :nominee_organization
      t.string :nominee_command
      t.string :endorsement_letter
      t.string :submission_form
      t.string :photo_a
      t.string :photo_b
      t.string :nomination_type
      t.string :nomination_year

      t.timestamps null: false
    end
  end
end
