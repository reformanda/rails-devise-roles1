# Feature: 'About' page
#   As a visitor
#   I want to visit an 'about' page
#   So I can learn more about the website
feature 'Non-authenticated User' do

  # Scenario: Visit the 'about' page
  #   Given I am a visitor
  #   When I visit the 'about' page
  #   Then I see "About the Website"
  scenario 'Visit the home page' do
    visit root_path
    expect(page).to have_link 'View Nomination Forms'
    expect(page).to have_no_link 'Score Reports'
  end

end
