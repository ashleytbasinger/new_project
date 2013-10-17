require 'spec_helper'

feature 'user can edit timelines', %Q{
  As an authenticated user,
  I want to be able to edit my own timelines
  So that I can change my timeline when I want to.

} do 

  let(:user) { FactoryGirl.create(:user) }
  let(:timeline) { FactoryGirl.create(:timeline) }

  scenario 'user can edit their timeline' do  

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit "/timelines"
    create_a_timeline
    click_link 'Edit'
    fill_in "Title", with: "something else"
    click_on "Update Timeline"
    expect(page).to have_content('Timeline was successfully updated.')
  end

  include PlantShareTestHelpers
end