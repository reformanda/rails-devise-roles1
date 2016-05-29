namespace :score_types do
  desc 'Adds AAE score types'
  task add_aae_score_type: :environment do

ScoreType.create!([
description: "AAE Award",
instructions: '',
])

end
end
