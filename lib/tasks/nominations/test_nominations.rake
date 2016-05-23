namespace :nominations do
  desc 'Create a bunch of Packard Nominations for testing'
  task test_nominations: :environment do


    Nomination.create!([
      {unit_commander_title: "Mr.", unit_commander_first_name: "Jerry1", unit_commander_last_name: "Lewis",
        unit_commander_suffix: "", unit_commander_phone: "202-345-0933", unit_commander_email: "jerry.lewis@mail.mil",
        unit_commander_organization: "USAASC",
        nominating_official_title: "LTC", nominating_official_first_name: "Mario", nominating_official_last_name: "Esperanza",
        nominating_official_suffix: "", nominating_official_phone: "703-555-3343", nominating_official_email: "mario.esperanza@mail.mil",
        nominating_point_of_contact_title: "Ms.", nominating_point_of_contact_first_name: "Lisa",
        nominating_point_of_contact_last_name: "Lewis", nominating_point_of_contact_suffix: "",
        nominating_point_of_contact_phone: "01-223-232-1212", nominating_point_of_contact_email: "lisa.lewis@mail.mil",
        nominating_point_of_contact_organization_address_1: "FORCECOM",
        nominating_point_of_contact_organization_address_2: "1001 E Main St",
        nominating_point_of_contact_city: "Atlanta", nominating_point_of_contact_state: "GA",
        nominating_point_of_contact_zip: "30311", nominating_point_of_contact_country: "USA",
        award_option_id: 1,
        nominee_title: "", nominee_first_name: "Roger1", nominee_last_name: "Rabbit", nominee_suffix: "",
        nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
        nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
        endorsement_letter: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
        submission_form_award_narrative: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
        nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
        nomination_type_id: 1,
        nomination_year: "2016" }
    ])


    Nomination.create!([
      {unit_commander_title: "Mr.", unit_commander_first_name: "Jerry2", unit_commander_last_name: "Lewis",
        unit_commander_suffix: "", unit_commander_phone: "202-345-0933", unit_commander_email: "jerry.lewis@mail.mil",
        unit_commander_organization: "USAASC",
        nominating_official_title: "LTC", nominating_official_first_name: "Mario", nominating_official_last_name: "Esperanza",
        nominating_official_suffix: "", nominating_official_phone: "703-555-3343", nominating_official_email: "mario.esperanza@mail.mil",
        nominating_point_of_contact_title: "Ms.", nominating_point_of_contact_first_name: "Lisa",
        nominating_point_of_contact_last_name: "Lewis", nominating_point_of_contact_suffix: "",
        nominating_point_of_contact_phone: "01-223-232-1212", nominating_point_of_contact_email: "lisa.lewis@mail.mil",
        nominating_point_of_contact_organization_address_1: "FORCECOM",
        nominating_point_of_contact_organization_address_2: "1001 E Main St",
        nominating_point_of_contact_city: "Atlanta", nominating_point_of_contact_state: "GA",
        nominating_point_of_contact_zip: "30311", nominating_point_of_contact_country: "USA",
        award_option_id: 1,
        nominee_title: "", nominee_first_name: "Roger2", nominee_last_name: "Rabbit", nominee_suffix: "",
        nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
        nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
        endorsement_letter: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
        submission_form_award_narrative: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
        nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
        nomination_type_id: 1,
        nomination_year: "2016" }
    ])


    Nomination.create!([
      {unit_commander_title: "Mr.", unit_commander_first_name: "Jerry3", unit_commander_last_name: "Lewis",
        unit_commander_suffix: "", unit_commander_phone: "202-345-0933", unit_commander_email: "jerry.lewis@mail.mil",
        unit_commander_organization: "USAASC",
        nominating_official_title: "LTC", nominating_official_first_name: "Mario", nominating_official_last_name: "Esperanza",
        nominating_official_suffix: "", nominating_official_phone: "703-555-3343", nominating_official_email: "mario.esperanza@mail.mil",
        nominating_point_of_contact_title: "Ms.", nominating_point_of_contact_first_name: "Lisa",
        nominating_point_of_contact_last_name: "Lewis", nominating_point_of_contact_suffix: "",
        nominating_point_of_contact_phone: "01-223-232-1212", nominating_point_of_contact_email: "lisa.lewis@mail.mil",
        nominating_point_of_contact_organization_address_1: "FORCECOM",
        nominating_point_of_contact_organization_address_2: "1001 E Main St",
        nominating_point_of_contact_city: "Atlanta", nominating_point_of_contact_state: "GA",
        nominating_point_of_contact_zip: "30311", nominating_point_of_contact_country: "USA",
        award_option_id: 1,
        nominee_title: "", nominee_first_name: "Roger3", nominee_last_name: "Rabbit", nominee_suffix: "",
        nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
        nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
        endorsement_letter: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
        submission_form_award_narrative: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
        nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
        nomination_type_id: 1,
        nomination_year: "2016" }
    ])


    Nomination.create!([
      {unit_commander_title: "Mr.", unit_commander_first_name: "Jerry4", unit_commander_last_name: "Lewis",
        unit_commander_suffix: "", unit_commander_phone: "202-345-0933", unit_commander_email: "jerry.lewis@mail.mil",
        unit_commander_organization: "USAASC",
        nominating_official_title: "LTC", nominating_official_first_name: "Mario", nominating_official_last_name: "Esperanza",
        nominating_official_suffix: "", nominating_official_phone: "703-555-3343", nominating_official_email: "mario.esperanza@mail.mil",
        nominating_point_of_contact_title: "Ms.", nominating_point_of_contact_first_name: "Lisa",
        nominating_point_of_contact_last_name: "Lewis", nominating_point_of_contact_suffix: "",
        nominating_point_of_contact_phone: "01-223-232-1212", nominating_point_of_contact_email: "lisa.lewis@mail.mil",
        nominating_point_of_contact_organization_address_1: "FORCECOM",
        nominating_point_of_contact_organization_address_2: "1001 E Main St",
        nominating_point_of_contact_city: "Atlanta", nominating_point_of_contact_state: "GA",
        nominating_point_of_contact_zip: "30311", nominating_point_of_contact_country: "USA",
        award_option_id: 1,
        nominee_title: "", nominee_first_name: "Roger4", nominee_last_name: "Rabbit", nominee_suffix: "",
        nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
        nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
        endorsement_letter: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
        submission_form_award_narrative: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
        nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
        nomination_type_id: 1,
        nomination_year: "2016" }
    ])



  end
end
