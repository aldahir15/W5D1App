require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'Username', with: 'jay'
      fill_in 'Password', with: 'password'
      click_on 'Create User'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content "Index Page"
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_user_url
    fill_in 'Username', with: 'jay'
    fill_in 'Password', with: 'password'
    click_on 'Create User'
    expect(page).to have_content "jay"
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit new_session_url
    expect(page).to have_content "Log In"
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_user_url
    fill_in 'Username', with: 'jay'
    fill_in 'Password', with: 'password'
    click_on 'Create User'
    click_on 'Log Out'
    expect(page).to_not have_content "jay"
  end

end
