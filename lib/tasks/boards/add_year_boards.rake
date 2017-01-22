namespace :boards do
  desc 'Adds year to boards'
  task add_year_boards: :environment do

      Board.where( year: nil ).update_all( year: 2016 )

  end
end
