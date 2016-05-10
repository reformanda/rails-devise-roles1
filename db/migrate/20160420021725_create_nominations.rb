class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.string :unit_commander_title
      t.string :unit_commander_first_name
      t.string :unit_commander_last_name
      t.string :unit_commander_suffix
      t.string :unit_commander_phone
      t.string :unit_commander_email
      t.string :unit_commander_organization
      t.string :nominating_official_title
      t.string :nominating_official_first_name
      t.string :nominating_official_last_name
      t.string :nominating_official_suffix
      t.string :nominating_official_phone
      t.string :nominating_official_email
      t.string :nominating_point_of_contact_title
      t.string :nominating_point_of_contact_first_name
      t.string :nominating_point_of_contact_last_name
      t.string :nominating_point_of_contact_suffix
      t.string :nominating_point_of_contact_phone
      t.string :nominating_point_of_contact_email
      t.string :nominating_point_of_contact_organization_address_1
      t.string :nominating_point_of_contact_organization_address_2
      t.string :nominating_point_of_contact_city
      t.string :nominating_point_of_contact_state
      t.string :nominating_point_of_contact_zip
      t.string :nominating_point_of_contact_country
      t.string :nominee_title
      t.string :nominee_first_name
      t.string :nominee_last_name
      t.string :nominee_suffix
      t.string :nominee_position_title
      t.string :nominee_email
      t.string :nominee_organization
      t.string :nominee_command
      t.string :nominee_team_name
      t.string :endorsement_letter
      t.string :submission_form
      t.string :photo_a
      t.string :photo_b
      t.string :nomination_year
      t.references :nomination_type, index: true, foreign_key: true
      t.references :award_option, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
