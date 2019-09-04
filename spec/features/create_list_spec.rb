require 'rails_helper'

RSpec.describe 'Creating a List', type: :feature do
  scenario 'valid inputs' do
    visit new_list_path
    fill_in 'Name', with: 'Shopping List'
    click_on 'Create List'
    visit lists_path
    expect(page).to have_content('Shopping List')
  end

  scenario 'invalid inputs' do
    visit new_list_path
    fill_in 'Name', with: ''
    click_on 'Create List'
    expect(page).to have_content("Name can't be blank")
  end

end
