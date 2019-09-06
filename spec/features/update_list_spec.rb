# spec/features/update_list_spec.rb
require 'rails_helper'


RSpec.describe 'Updating a list', type: :feature do
  # before do
  #   user = FactoryBot.create(:user)
  #   login_as(user, :scope => :user)
  # end
  #login_as

  scenario 'valid inputs' do
    shoplist = List.create!(name: 'ShopList')
    visit edit_list_path(id: shoplist.id)
    fill_in 'Name', with: 'Shopping List'
    click_on 'Update List'
    visit lists_path
    expect(page).to have_content('Shopping List')
  end
end
