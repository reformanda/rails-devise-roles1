namespace :boards do
  desc 'Initializes the boards'
  task initialize_boards: :environment do

    Board.delete_all
    Board.reset_pk_sequence

 #<Board id: 1, description: "First Board", start_date: "2016-05-21 23:33:00", end_date: "2016-06-21 23:33:00", nomination_type_id: 1, created_at: "2016-05-21 23:33:25", updated_at: "2016-05-22 01:19:01", users_list: ["", "2"]>]>
    Board.create!([
description: "2016 David Packard Excellence in Acquisition Award",
start_date: nil,
end_date: Date.new(2016,6,30),
nomination_type_id: 1,
score_type_id: 1
      ])

      Board.create!([
  description: "2016 Should Cost and Innovation Award",
  start_date: nil,
  end_date: Date.new(2016,6,30),
  nomination_type_id: 2,
  score_type_id: 1
        ])

        Board.create!([
    description: "2016 Defense Acquisition Workforce Development Award",
    start_date: nil,
    end_date: nil,
    nomination_type_id: 3,
    score_type_id: 2
          ])

          Board.create!([
      description: "2016 Defense Acquisition Workforce Individual Achievement Award",
      start_date: nil,
      end_date: nil,
      nomination_type_id: 4,
      score_type_id: 3
            ])

            Board.create!([
        description: "2016 Secretary of Defense Performance-Based Logistics",
        start_date: nil,
        end_date: nil,
        nomination_type_id: 5,
        score_type_id: 4
              ])

              Board.create!([
          description: "2016 Secretary of Defense Product Support Manager",
          start_date: nil,
          end_date: nil,
          nomination_type_id: 6,
          score_type_id: 5
                ])

  end
end
