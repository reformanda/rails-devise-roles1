NominationType.create!([
  {year: "2016", code: "Packard", description: "The David Packard Excellence in Acquisition Award, sponsored by the Under Secretary of Defense for Acquisition, Technology, and Logistics (USD(AT&L)), recognizes Department of Defense civilian and military organizations, groups, or teams who have demonstrated exemplary innovation and best practices in the acquisition of products and services. This award reflects achievements that exemplify goals and objectives established for furthering life cycle cost reduction and/or acquisition excellence in the Department. Multiple teams may receive the award based on merit. This call for nominations application is for nominations from the U.S. Army. The U.S. Army Acquisition Support Center (USAASC) is the official collection point for U.S. Army nominations. USAASC will compile the nominations and submit to senior leadership, who will then select and forward the Army submissions to USD(AT&L) for consideration. ", awards_announcement: nil, implementing_instructions: nil, submission_form: nil, award_narrative: nil, guidelines: nil, nomination_end_date: "04/27/2016", title: "David Packard Excellence in Acquisition Award "},
  {year: "2016", code: "Should", description: "The Should Cost and Innovation Award specifically targets organizations that have displayed outstanding commitment, innovation, and results to should-cost management. It recognizes organizations, groups or teams that have displayed outstanding commitment, innovation, and results to should cost management. As a core, enduring BBP initiative, most programs and contracted activities in DOD now have should-cost targets and are managing to them. ", awards_announcement: nil, implementing_instructions: nil, submission_form: nil, award_narrative: nil, guidelines: nil, nomination_end_date: "05/27/2016", title: "USD(AT&L) Should Cost and Innovation Award"},
  {year: "2016", code: "Development", description: "The Defense Acquisition Workforce Development Award recognizes organizations that have displayed outstanding commitment, innovation, and results to develop and support the success of their acquisition, technology and logistics professionals.\r\n\r\nThe U.S. Army Acquisition Support Center (USAASC) is the official collection point for U.S. Army nominations. USAASC will compile the nominations and submit to senior leadership, who will then select and forward the Army submissions to USD(AT&L) for consideration.", awards_announcement: nil, implementing_instructions: nil, submission_form: nil, award_narrative: nil, guidelines: nil, nomination_end_date: "05/27/2016", title: "Defense Acquisition Workforce Development Award"},
  {year: "2016", code: "Achievement", description: "The Defense Acquisition Workforce Individual Achievement Award has been established to encourage and recognize excellent performance by members of the Defense Acquisition Workforce in the acquisition of products and services for the DOD. This program recognizes individuals (military or civilian) who represent the best in the various acquisition workforce disciplines.", awards_announcement: nil, implementing_instructions: nil, submission_form: nil, award_narrative: nil, guidelines: nil, nomination_end_date: "05/28/2016", title: "Defense Acquisition Workforce Achievement Award"},
  {year: "2016", code: "Logistic", description: "", awards_announcement: nil, implementing_instructions: nil, submission_form: nil, award_narrative: nil, guidelines: nil, nomination_end_date: "", title: "Secretary of Defense Performance-Based Logistics"},
  {year: "2016", code: "ProductSupport", description: "", awards_announcement: nil, implementing_instructions: nil, submission_form: nil, award_narrative: nil, guidelines: nil, nomination_end_date: "", title: "The Secretary of Defense Product Support Manager"}
])

AwardOption.create!([
  {name: "USD(AT&L) Should Cost and Innovation Award", nomination_type_id: 2},
  {name: "Program Management", nomination_type_id: 1},
  {name: "Auditing", nomination_type_id: 4},
  {name: "Financial Management", nomination_type_id: 4},
  {name: "Contracting and Procurement (including Industrial/Contract Property Management)", nomination_type_id: 4},
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
  {name: "Cost", nomination_type_id: 4},
  {name: "Development", nomination_type_id: 3},
  {name: "Major Defense Acquisition Programs, ACATs 1 ", nomination_type_id: 6},
  {name: "Major Weapon System/Other Weapon Systems, ACATII", nomination_type_id: 6},
  {name: "Component level", nomination_type_id: 5},
  {name: "Subsystem Level", nomination_type_id: 5},
  {name: "System level", nomination_type_id: 5}
])
