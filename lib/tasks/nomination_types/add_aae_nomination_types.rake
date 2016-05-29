namespace :nomination_types do
  desc 'Create AAE nomination types'
  task add_aae_nomination_types: :environment do




    NominationType.create!([
year: "2016", code: "Asp", title:  "Acquisition Support Professional of the Year",

      ])

    NominationType.create!([
year: "2016", code: "Battalion", title:  "Contracting Battalion/DCMA Team of the Year",
      ])

    NominationType.create!([
year: "2016", code: "Bop", title:  "Business Operations Professional of the Year",
      ])

    NominationType.create!([
year: "2016", code: "Brigade", title:  "Contracting Brigade/DCMA Team of the Year",
      ])

    NominationType.create!([
year: "2016", code: "Cp", title:  "Contracting Professional of the Year",
      ])

    NominationType.create!([
year: "2016", code: "Decp", title:  "Defense Exportability and Cooperation Professional of the Year",
      ])

    NominationType.create!([
year: "2016", code: "Esi", title:  "Engineer and System Integrator of the Year",
      ])

    NominationType.create!([
year: "2016", code: "Loy", title:  "Logistician of the Year",
      ])

    NominationType.create!([
year: "2016", code: "Nco", title:  "Contracting NCO of the Year",
      ])

    NominationType.create!([
year: "2016", code: "Pmpdot05", title:  "Product Management/Product Director Office Team of the Year (05 Level)",
      ])

    NominationType.create!([
year: "2016", code: "Pmpdot06", title:  "Project Management/Project Director Office Team of the Year (06 Level)",
      ])

    NominationType.create!([
year: "2016", code: "Pmppdp05", title:  "Product Management/Product Director Professional of the Year (05 Level)",
      ])

    NominationType.create!([
year: "2016", code: "Pmppdp06", title:  "Project Management/Project Director Professional of the Year (06 Level)",
      ])

    NominationType.create!([
year: "2016", code: "Stp", title:  "Science and Technology Professional of the Year",
      ])

  end
end
