namespace :boards do
  desc 'Adds AAE boards'
  task add_aae_boards: :environment do




 #<Board id: 1, description: "First Board", start_date: "2016-05-21 23:33:00", end_date: "2016-06-21 23:33:00", nomination_type_id: 1, created_at: "2016-05-21 23:33:25", updated_at: "2016-05-22 01:19:01", users_list: ["", "2"]>]>
    Board.create!([
description: "2016 Acquisition Support Professional of the Year",
start_date: nil,
end_date: Date.new(2016,6,30),
nomination_type_id: 7,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Contracting Battalion/DCMA Team of the Year",
start_date: nil,
end_date: Date.new(2016,6,30),
nomination_type_id: 8,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Business Operations Professional of the Year",
start_date: nil,
end_date: nil,
nomination_type_id: 9,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Contracting Brigade/DCMA Team of the Year",
start_date: nil,
end_date: nil,
nomination_type_id: 10,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Contracting Professional of the Year",
start_date: nil,
end_date: nil,
nomination_type_id: 11,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Defense Exportability and Cooperation Professional of the Year",
start_date: nil,
end_date: nil,
nomination_type_id: 12,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Engineer and System Integrator of the Year",
start_date: nil,
end_date: nil,
nomination_type_id: 13,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Logistician of the Year",
start_date: nil,
end_date: nil,
nomination_type_id: 14,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Contracting NCO of the Year",
start_date: nil,
end_date: nil,
nomination_type_id: 15,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Product Management/Product Director Office Team of the Year (05 Level)",
start_date: nil,
end_date: nil,
nomination_type_id: 16,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Project Management/Project Director Office Team of the Year (06 Level)",
start_date: nil,
end_date: nil,
nomination_type_id: 17,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Product Management/Product Director Professional of the Year (05 Level)",
start_date: nil,
end_date: nil,
nomination_type_id: 18,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Project Management/Project Director Professional of the Year (06 Level)",
start_date: nil,
end_date: nil,
nomination_type_id: 19,
score_type_id: 6
      ])

    Board.create!([
description: "2016 Science and Technology Professional of the Year",
start_date: nil,
end_date: nil,
nomination_type_id: 20,
score_type_id: 6
      ])


  end
end
