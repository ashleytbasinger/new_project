require 'spec_helper'

feature 'user creates a timeline', %Q{
  As an authenticated user,
  I want to chronicle my photos
  So that I can track their progress.

} do 

  let(:user) { FactoryGirl.create(:user) }

  scenario 'user creates a timeline' do 
    sign_in_as(user)
    prev_count = Timeline.count
    visit new_timeline_path
    fill_in "Title", with: "Carnivorous plants"
    click_button "Create Timeline"
    expect(page).to have_content("Timeline was successfully created.")
    expect(Timeline.count).to eql(prev_count + 1)
  end
  include PlantShareTestHelpers
end