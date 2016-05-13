namespace :nominations do
  desc 'Sets status of nominations to entered (if missing)'
  task set_status: :environment do
    Nomination.where( status: nil ).update_all( status: 1 )
  end
end
