require 'rails_helper'

RSpec.describe Task, type: :model do

  describe 'associations' do
    it { should belong_to(:list).class_name('list') }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:completed) }
  end
end
