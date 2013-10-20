require 'spec_helper'

feature 'user uploads a photo', %Q{
  As an authorized user,
  I want to upload a photo
  So that I can share my plant's progress.
} do 

    # Acceptance Criteria

    # * I can only upload a specified file type
    # * If I try to upload something that is invalid,
    #   I get an error message
    # * I get a confirmation and view the photo if the
    #   upload was successful
    # * I can only upload photos to a page I own

  let(:user) { FactoryGirl.create(:user) }
  #let(:timeline) { FactoryGirl.create(:timeline) }

  scenario 'user uploads a photo' do 
    #sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    #create_a_timeline
    prev_count = Timeline.count
    visit new_timeline_path
    fill_in "Title", with: "timeline1"
    click_button "Create Timeline"
    expect(page).to have_content("Timeline was successfully created.")
    expect(Timeline.count).to eql(prev_count + 1)

    click_link "Upload Progress"
    visit new_photo_path
    fill_in "Title", with: "Day 1"
    select '2013', from: 'photo_date_1i'
    select 'October', from: 'photo_date_2i'
    select '1', from: 'photo_date_3i'

    attach_file("Image", "spec/images/flytrap1.jpg")
    select "timeline1", from: "photo[timeline_id]"
    click_button "Create Photo"
    expect(page).to have_content("Photo was successfully created.")
    expect(Photo.count).to eql(1)
    entry = Photo.first
    #expect(entry.user_id).to eql(user.id)
    expect(entry.title).to eql("Day 1")
    expect(entry.image).to_not be_nil
  end

  include PlantShareTestHelpers
end