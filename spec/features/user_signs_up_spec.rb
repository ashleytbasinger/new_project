require 'spec_helper'

feature 'user signs up', %q{
  As an avid plant-lover,
  I want to sign up for an account
  So that I can share and track my plants' growth.
} do
  
  # Acceptance Criteria:
  # * I can sign up for a PlantShare account by providing a username, password, and valid email
  # * If I don't provide a username, password, and valid email, I will not be registered

  scenario 'guest creates account' do
    prev_count = User.count

    visit root_path
    click_link 'Sign up'

    fill_in 'Username', with: 'poison_ivy'
    fill_in 'Email', with: 'poison@gmail.com'
    fill_in 'user_password', with: "1234567890"
    fill_in 'Password confirmation', with: "1234567890"

    click_button 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(User.count).to eql(prev_count + 1)
  end

  scenario 'user signs up with invalid credentials' do
    previous_count = User.count

    visit new_user_registration_path
    click_button 'Sign up'

    expect(page).to have_content("can't be blank")
    expect(User.count).to eql(previous_count)
  end
end