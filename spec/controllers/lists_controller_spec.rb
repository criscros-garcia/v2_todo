require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  login_user

  #it { should use_before_action(:authenticate_user!) }

  scenario 'has a valid name' do
    # user = create(:user)
    list = subject.current_user.lists.new(name: 'Name example')
    expect(list).to be_valid
  end

  scenario 'has invalid name' do
    list = subject.current_user.lists.new(name: '')
    list.valid?
    expect(list.errors[:name]).to include("can't be blank", "is too short (minimum is 5 characters)")
  end

  scenario 'is invalid with special characters in the name' do
    list = subject.current_user.lists.new(name: '.$%&-')
    list.valid?
    expect(list.errors[:name]).to include("Please, just letters and numbers are allowed")
  end

  context 'GET #index' do
    scenario 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  context 'GET #show' do
    scenario 'return a success response' do
      list = subject.current_user.lists.create(name: 'Name example1')
      get :show, params: { id: list.to_param }
      expect(response).to be_successful
    end
  end

  context 'GET #edit' do
    it 'return a success response' do
      list = subject.current_user.lists.create(name: 'Name example1')
      get :edit, params: { id: list.to_param }
      expect(response).to be_successful
    end
  end

  context 'POST #create' do
    let!(:list) { FactoryBot.create(:list, user: subject.current_user) }

    it 'creates a new list' do
      params = {
        name: 'Name 1'
      }
      expect { post(:create, params: { list: params }) }.to change(List, :count).by(1)
      expect(flash[:notice]).to eq 'List was successfully created.'
    end
  end
end
