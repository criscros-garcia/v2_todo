module ControllerMacros

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end

  def login_as
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      login_as user
    end
  end


end
# before do
#   user = FactoryBot.create(:user)
#   login_as(user, :scope => :user)
# end
