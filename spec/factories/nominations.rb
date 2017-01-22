FactoryGirl.define do
  factory :nomination do
    award_option
    unit_commander_first_name "commander_first"
    unit_commander_last_name "commander_last"
    unit_commander_phone "(222) 444-5555"
    unit_commander_email "commander@email.com"
    unit_commander_organization "commander_organization"
    nominating_point_of_contact_first_name "poc_first"
    nominating_point_of_contact_last_name "poc_last"
    nominating_point_of_contact_email "poc@email.com"
    nominating_point_of_contact_phone "(333) 555-6666"
    nominating_point_of_contact_organization_address_1 "123 Main Street"
    nominating_point_of_contact_city "contact_city"
    award_option_id "1"
    nominee_email "nominee@email.com"
    nominee_organization "nominee organization"
    nominee_command "nominee command"
    nominee_first_name "nominee_first"
    nominee_last_name "nominee_last"
  end
end
