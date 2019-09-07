# spec/features/update_list_spec.rb
require 'rails_helper'


RSpec.describe 'Updating a list', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

  scenario 'valid inputs' do
    shoplist = @user.lists.create!(name: 'ShopList')

    visit edit_list_path(id: shoplist.id)
    fill_in 'Name', with: 'Shopping List'
    click_on 'Update List'
    visit lists_path
    expect(page).to have_content('Shopping List')
  end
end
