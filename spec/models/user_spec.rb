require 'rails_helper'

describe User do
  describe 'associations' do
    it { should have_many(:lists) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
  end
end
