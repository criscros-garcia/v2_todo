require 'rails_helper'


RSpec.describe 'Creating a List', type: :feature do
  # before do
  #   user = FactoryBot.create(:user)
  #   login_as(user, :scope => :user)
  # end

  #login_user
  #login_as

    scenario 'with valid inputs' do
      visit new_list_path
      fill_in 'Name', with: 'Shopping List'
      click_on 'Create List'
      visit lists_path
      expect(page).to have_content('Shopping List')
  end

  scenario 'with invalid inputs' do
    visit new_list_path
    fill_in 'Name', with: ''
    click_on 'Create List'
    expect(page).to have_content("Name can't be blank")
  end

end
