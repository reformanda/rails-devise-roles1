

Nomination.delete_all
NominationType.delete_all
AwardOption.delete_all

NominationType.create!([
  {year: "2016", code: "Packard", description: "The David Packard Excellence in Acquisition Award, sponsored by the Under Secretary of Defense for Acquisition, Technology, and Logistics (USD(AT&L)), recognizes Department of Defense civilian and military organizations, groups, or teams who have demonstrated exemplary innovation and best practices in the acquisition of products and services. This award reflects achievements that exemplify goals and objectives established for furthering life cycle cost reduction and/or acquisition excellence in the Department. Multiple teams may receive the award based on merit. This call for nominations application is for nominations from the U.S. Army. The U.S. Army Acquisition Support Center (USAASC) is the official collection point for U.S. Army nominations. USAASC will compile the nominations and submit to senior leadership, who will then select and forward the Army submissions to USD(AT&L) for consideration. ",
    awards_announcement: File.open(Rails.root + "db/attachments/2016-DOD-Award-Announcement-Memo.pdf"),
    implementing_instructions: File.open(Rails.root + "db/attachments/2016-packard-instructions.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/2016-packard-submission.docx"),
    award_narrative: File.open(Rails.root + "db/attachments/2016-packard-example.pdf"),
    guidelines: nil,
    nomination_end_date: "05/31/2016", title: "David Packard Excellence in Acquisition Award "},
  {year: "2016", code: "Should", description: "The Should Cost and Innovation Award specifically targets organizations that have displayed outstanding commitment, innovation, and results to should-cost management. It recognizes organizations, groups or teams that have displayed outstanding commitment, innovation, and results to should cost management. As a core, enduring BBP initiative, most programs and contracted activities in DOD now have should-cost targets and are managing to them. ",
    awards_announcement: File.open(Rails.root + "db/attachments/2016-DOD-Award-Announcement-Memo.pdf"),
    implementing_instructions: File.open(Rails.root + "db/attachments/2016-should-cost-instructions.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/2016-should-submission.docx"),
    award_narrative: File.open(Rails.root + "db/attachments/2016-should-cost-example.pdf"),
    guidelines: nil, nomination_end_date: "05/31/2016", title: "USD(AT&L) Should Cost and Innovation Award"},
  {year: "2016", code: "Development", description: "The Defense Acquisition Workforce Development Award recognizes organizations that have displayed outstanding commitment, innovation, and results to develop and support the success of their acquisition, technology and logistics professionals.\r\n\r\nThe U.S. Army Acquisition Support Center (USAASC) is the official collection point for U.S. Army nominations. USAASC will compile the nominations and submit to senior leadership, who will then select and forward the Army submissions to USD(AT&L) for consideration.",
    awards_announcement: File.open(Rails.root + "db/attachments/2016-DOD-Award-Announcement-Memo.pdf"),
    implementing_instructions: File.open(Rails.root + "db/attachments/2016-development-instructions.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/2016-development-submission.docx"),
    award_narrative: File.open(Rails.root + "db/attachments/2016-development-example.pdf"),
    guidelines: nil, nomination_end_date: "05/31/2016", title: "Defense Acquisition Workforce Development Award"},
  {year: "2016", code: "Achievement", description: "The Defense Acquisition Workforce Individual Achievement Award has been established to encourage and recognize excellent performance by members of the Defense Acquisition Workforce in the acquisition of products and services for the DOD. This program recognizes individuals (military or civilian) who represent the best in the various acquisition workforce disciplines.",
    awards_announcement: File.open(Rails.root + "db/attachments/2016-DOD-Award-Announcement-Memo.pdf"),
    implementing_instructions: File.open(Rails.root + "db/attachments/2016-achievement-instructions.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/2016-achievement-submission.docx"),
    award_narrative: File.open(Rails.root + "db/attachments/2016-achievement-example.pdf"),
    guidelines: nil, nomination_end_date: "05/31/2016", title: "Defense Acquisition Workforce Achievement Award"},
  {year: "2016", code: "Logistic", description: "",
    awards_announcement: File.open(Rails.root + "db/attachments/2016-PBL-award-memo.pdf"),
    implementing_instructions: File.open(Rails.root + "db/attachments/2016-PBL-award-instructions-v2.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/2016-pbl-submission.docx"),
    award_narrative: File.open(Rails.root + "db/attachments/2016-pbl-example.pdf"),
    guidelines: nil, nomination_end_date: "05/31/2016", title: "Secretary of Defense Performance-Based Logistics"},
  {year: "2016", code: "ProductSupport", description: "",
    awards_announcement: File.open(Rails.root + "db/attachments/2016-PSM-award-memo.pdf"),
    implementing_instructions: File.open(Rails.root + "db/attachments/2016-PSM-award-instructions-v2.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/2016-psm-submission-form.docx"),
    award_narrative: File.open(Rails.root + "db/attachments/2016-psm-example.pdf"),
    guidelines: nil, nomination_end_date: "05/31/2016", title: "The Secretary of Defense Product Support Manager"}
])

AwardOption.create!([
  {name: "Program Management", nomination_type_id: 1},
  {name: "USD(AT&L) Should Cost and Innovation Award", nomination_type_id: 2},
  {name: "Small Organization--organizations with fewer than 500 employees", nomination_type_id: 3},
  {name: "Large Organization--organizations with 500 or more employees", nomination_type_id: 3},
  {name: "Auditing", nomination_type_id: 4},
  {name: "Financial Management", nomination_type_id: 4},
  {name: "Contracting and Procurement", nomination_type_id: 4},
  {name: "Facilities Engineering", nomination_type_id: 4},
  {name: "Information Technology", nomination_type_id: 4},
  {name: "Life-Cycle Logistics", nomination_type_id: 4},
  {name: "Production, Quality, and Manufacturing", nomination_type_id: 4},
  {name: "Program Management", nomination_type_id: 4},
  {name: "Science and Technology Manager", nomination_type_id: 4},
  {name: "Test and Evaluation", nomination_type_id: 4},
  {name: "Earned Value Management", nomination_type_id: 4},
  {name: "Requirements Management", nomination_type_id: 4},
  {name: "Services Acquisition", nomination_type_id: 4},
  {name: "Small Business", nomination_type_id: 4},
  {name: "Acquisition in an Expeditionary Environment", nomination_type_id: 4},
  {name: "Cost Estimating", nomination_type_id: 4},
  {name: "Engineering", nomination_type_id: 4},
  {name: "Industrial/Contract Property Management", nomination_type_id: 4},
  {name: "Major Defense Acquisition Programs, ACATs 1 ", nomination_type_id: 6},
  {name: "Major Weapon System/Other Weapon Systems, ACATII", nomination_type_id: 6},
  {name: "Component level", nomination_type_id: 5},
  {name: "Subsystem Level", nomination_type_id: 5},
  {name: "System level", nomination_type_id: 5}
])


Nomination.create!([
  {unit_commander_title: "Mr.", unit_commander_first_name: "Jerry", unit_commander_last_name: "Lewis",
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
    nominee_title: "", nominee_first_name: "Roger", nominee_last_name: "Rabbit", nominee_suffix: "",
    nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
    nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
    endorsement_letter: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
    nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
    nomination_type_id: 1,
    nomination_year: "2016" }
])

Nomination.create!([
  {unit_commander_title: "Mr.", unit_commander_first_name: "Ron", unit_commander_last_name: "Lewis",
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
    award_option_id: 2,
    nominee_title: "", nominee_first_name: "Bugs", nominee_last_name: "Bunny", nominee_suffix: "",
    nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
    nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
    endorsement_letter: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
    nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
    nomination_type_id: 2,
    nomination_year: "2016" }
])

Nomination.create!([
  {unit_commander_title: "Mr.", unit_commander_first_name: "Jerry", unit_commander_last_name: "Lewis",
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
    award_option_id: 3,
    nominee_title: "Sgt", nominee_first_name: "Jack", nominee_last_name: "York", nominee_suffix: "",
    nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
    nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
    endorsement_letter: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
    nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
    nomination_type_id: 3,
    nomination_year: "2016" }
])

Nomination.create!([
  {unit_commander_title: "Mr.", unit_commander_first_name: "Ricky", unit_commander_last_name: "Martinez",
    unit_commander_suffix: "", unit_commander_phone: "202-345-0933", unit_commander_email: "jerry.lewis@mail.mil",
    unit_commander_organization: "USAASC",
    nominating_official_title: "", nominating_official_first_name: "Maria", nominating_official_last_name: "Schriver",
    nominating_official_suffix: "", nominating_official_phone: "703-555-3343", nominating_official_email: "maria.esperanza@mail.mil",
    nominating_point_of_contact_title: "Mr.", nominating_point_of_contact_first_name: "Alex",
    nominating_point_of_contact_last_name: "Haley", nominating_point_of_contact_suffix: "",
    nominating_point_of_contact_phone: "01-223-232-1212", nominating_point_of_contact_email: "lisa.lewis@mail.mil",
    nominating_point_of_contact_organization_address_1: "FORCECOM",
    nominating_point_of_contact_organization_address_2: "1001 E Main St",
    nominating_point_of_contact_city: "Atlanta", nominating_point_of_contact_state: "GA",
    nominating_point_of_contact_zip: "30311", nominating_point_of_contact_country: "USA",
    award_option_id: 1,
    nominee_title: "", nominee_first_name: "Woody", nominee_last_name: "Allen", nominee_suffix: "",
    nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
    nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
    endorsement_letter: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
    nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
    nomination_type_id: 1,
    nomination_year: "2016" }
])

Nomination.create!([
  {unit_commander_title: "Mr.", unit_commander_first_name: "Jerry", unit_commander_last_name: "Lewis",
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
    award_option_id: 4,
    nominee_title: "", nominee_first_name: "Roger", nominee_last_name: "Roberts", nominee_suffix: "",
    nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
    nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
    endorsement_letter: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
    nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
    nomination_type_id: 4,
    nomination_year: "2016" }
])

Nomination.create!([
  {unit_commander_title: "Mr.", unit_commander_first_name: "Jerry", unit_commander_last_name: "Lewis",
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
    award_option_id: 6,
    nominee_title: "", nominee_first_name: "Maxwell", nominee_last_name: "Smith", nominee_suffix: "",
    nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
    nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
    endorsement_letter: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
    nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
    nomination_type_id: 4,
    nomination_year: "2016" }
])

Nomination.create!([
  {unit_commander_title: "Mr.", unit_commander_first_name: "Rachel", unit_commander_last_name: "Carter",
    unit_commander_suffix: "", unit_commander_phone: "202-345-0933", unit_commander_email: "jerry.lewis@mail.mil",
    unit_commander_organization: "USAASC",
    nominating_official_title: "", nominating_official_first_name: "Mary", nominating_official_last_name: "Johnson",
    nominating_official_suffix: "", nominating_official_phone: "703-555-3343", nominating_official_email: "mario.esperanza@mail.mil",
    nominating_point_of_contact_title: "Ms.", nominating_point_of_contact_first_name: "Lisa",
    nominating_point_of_contact_last_name: "Lewis", nominating_point_of_contact_suffix: "",
    nominating_point_of_contact_phone: "01-223-232-1212", nominating_point_of_contact_email: "lisa.lewis@mail.mil",
    nominating_point_of_contact_organization_address_1: "FORCECOM",
    nominating_point_of_contact_organization_address_2: "1001 E Main St",
    nominating_point_of_contact_city: "Atlanta", nominating_point_of_contact_state: "GA",
    nominating_point_of_contact_zip: "30311", nominating_point_of_contact_country: "USA",
    award_option_id: 25,
    nominee_title: "", nominee_first_name: "Maxwell", nominee_last_name: "Smith", nominee_suffix: "",
    nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
    nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
    submission_pdf: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
    submission_word_document: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
    nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
    nomination_type_id: 5,
    nomination_year: "2016" }
])

Nomination.create!([
  {unit_commander_title: "Mr.", unit_commander_first_name: "Joel", unit_commander_last_name: "Ash",
    unit_commander_suffix: "", unit_commander_phone: "202-345-0933", unit_commander_email: "jerry.lewis@mail.mil",
    unit_commander_organization: "USAASC",
    nominating_official_title: "", nominating_official_first_name: "Thomas", nominating_official_last_name: "Merkle",
    nominating_official_suffix: "", nominating_official_phone: "703-555-3343", nominating_official_email: "mario.esperanza@mail.mil",
    nominating_point_of_contact_title: "Ms.", nominating_point_of_contact_first_name: "Lisa",
    nominating_point_of_contact_last_name: "Lewis", nominating_point_of_contact_suffix: "",
    nominating_point_of_contact_phone: "01-223-232-1212", nominating_point_of_contact_email: "lisa.lewis@mail.mil",
    nominating_point_of_contact_organization_address_1: "FORCECOM",
    nominating_point_of_contact_organization_address_2: "1001 E Main St",
    nominating_point_of_contact_city: "Atlanta", nominating_point_of_contact_state: "GA",
    nominating_point_of_contact_zip: "30311", nominating_point_of_contact_country: "USA",
    award_option_id: 26,
    nominee_title: "", nominee_first_name: "Maxwell", nominee_last_name: "Smith", nominee_suffix: "",
    nominee_position_title: "Lead Rabbit", nominee_email: "roger.rabbit@mail.mil",
    nominee_organization: "Runners Lab", nominee_command: "Technology", nominee_team_name: nil,
    endorsement_letter: File.open(Rails.root + "db/attachments/DAU-ds.pdf"),
    submission_form: File.open(Rails.root + "db/attachments/DAU-fa.pdf"),
    nominee_organization_logo: File.open(Rails.root + "db/attachments/screenshot.png"),
    nomination_type_id: 6,
    nomination_year: "2016" }
])


User.find_or_create_by!(email: "CATHERINE.H.DERAN@saic.com") do |user|
  user.name = "Catherine Deran"
  user.password = "password123"
  user.password_confirmation = "password123"
  user.admin!
end

User.find_or_create_by!(email: "jwilson1@networkrunners.com") do |user|
  user.name = "Catherine Deran"
  user.password = "password123"
  user.password_confirmation = "password123"
  user.admin!
end
