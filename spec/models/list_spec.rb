require "rails_helper"

  # RSpec.describe List, type: :model do
  #   it "has a name" do
  #     user = create :user
  #     list = List.create!(name:"Shopping List", user :user)
  #     expect(list.name).to eq("Shopping List")
  #   end
  # end
  RSpec.describe List, type: :model do
    describe "validations" do
      describe "it has not present name" do
        let(:list) {build(:list,name:'')}
        it 'should be invalid' do
          expect(list.valid?).to be_falsey
        end
      end
    end
end
