require 'spec_helper'

feature 'user signs out', %Q{
  As an authorized user,
  I want to be able to logout of PlantShare
  So that I can login at another time or from another place.
} do 

# Acceptance Criteria:

# * I can log out of the site
# * I can log in at another time with my unique username and password

let(:user) { FactoryGirl.create(:user) }

  scenario 'user signs out' do 
    sign_in_as(user)
    click_link "Sign out"

    expect(page).to have_content('Signed out successfully.')
  end

  include PlantShareTestHelpers

end