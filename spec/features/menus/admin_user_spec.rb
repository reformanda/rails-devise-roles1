# Feature: 'About' page
#   As a visitor
#   I want to visit an 'about' page
#   So I can learn more about the website
feature 'Admin User', :devise do

  # Scenario: Visit the 'about' page
  #   Given I am a visitor
  #   When I visit the 'about' page
  #   Then I see "About the Website"
  scenario 'Visit the home page' do
    user = FactoryGirl.create(:user, :admin)
    signin(user.email, user.password)
    visit root_path
    expect(page).to have_link 'View Nomination Forms'
    expect(page).to have_link 'Manage Nomination Types'
    expect(page).to have_link 'Manage Award Options'
    expect(page).to have_link 'Manage Score Types'
    expect(page).to have_link 'Manage Boards'
    expect(page).to have_link 'Manage Users'
    expect(page).to have_link 'Manage Nominations'
    expect(page).to have_link 'Score Reports'
    expect(page).to have_link 'View Boards'
  end

end
