module PlantShareTestHelpers

  def sign_in_as(user)
    visit new_user_session_path
    save_and_open_page
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end

  def create_a_timeline
    prev_count = Timeline.count
    visit new_timeline_path
    fill_in "Title", with: "Carnivorous plants"
    click_button "Create Timeline"
    expect(page).to have_content("Timeline was successfully created.")
    expect(Timeline.count).to eql(prev_count + 1)
  end
end