namespace :award_options do
  desc 'Create AAE award options'
  task add_aae_award_options: :environment do

AwardOption.create!([
    {name: "Acquisition Support Professional of the Year", nomination_type_id: 7},
    {name: "Contracting Battalion/DCMA Team of the Year", nomination_type_id: 8},
    {name: "Business Operations Professional of the Year", nomination_type_id: 9},
    {name: "Contracting Brigade/DCMA Team of the Year", nomination_type_id: 10},
    {name: "Contracting Professional of the Year", nomination_type_id: 11},
    {name: "Defense Exportability and Cooperation Professional of the Year", nomination_type_id: 12},
    {name: "Engineer and System Integrator of the Year", nomination_type_id: 13},
    {name: "Logistician of the Year", nomination_type_id: 14},
    {name: "Contracting NCO of the Year", nomination_type_id: 15},
    {name: "Product Management/Product Director Office Team of the Year (05 Level)", nomination_type_id: 16},
    {name: "Project Management/Project Director Office Team of the Year (06 Level)", nomination_type_id: 17},
    {name: "Product Management/Product Director Professional of the Year (05 Level)", nomination_type_id: 18},
    {name: "Product Management/Product Director Professional of the Year (06 Level)", nomination_type_id: 19},
    {name: "Science and Technology Professional of the Year", nomination_type_id: 20},
  ])

  end
end
