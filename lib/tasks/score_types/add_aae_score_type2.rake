namespace :score_types do
  desc 'Adds AAE score types 2'
  task add_aae_score_type: :environment do

ScoreType.create!([
description: "AAE Award (Team)",
instructions: '',
])

end
end
