require 'rails_helper'

RSpec.describe List, type: :model do
  login_user
  it "has a valid factory" do
    expect(current_user.list).to be_valid
  end
end
