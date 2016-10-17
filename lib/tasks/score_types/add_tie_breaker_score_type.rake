namespace :score_types do
  desc 'Adds Tie Breaker Score Type'
  task add_tie_breaker_score_type: :environment do

ScoreType.create!([
description: "Tie Breaker",
instructions: '',
])

end
end
