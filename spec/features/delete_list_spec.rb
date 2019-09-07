# spec/features/delete_list_spec.rb
require 'rails_helper'


RSpec.describe 'Deleting a list', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

  scenario 'success' do
    @user.lists.create!(name: 'Homework')
    visit lists_path
    expect(page).to have_content('Homework')
    click_on 'Destroy'
    expect(page).not_to have_content('Homework')
  end
end
