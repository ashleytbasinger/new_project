require 'spec_helper'

feature 'user signs in', %Q{
  As an authorized user, 
  I want to login with my email and password,
  So that I can post photos, comments, and view other timelines.

} do 

  # Acceptance Criteria:
  # * an authorized user provides their email and password to gain access to the site
  # * if I provide this information, I will be able to post photos, comments, and view other timelines

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user signs in with valid credentials' do 
    sign_in_as(user)

    expect(page).to have_content('Signed in successfully.')
  end

  include PlantShareTestHelpers
  
end