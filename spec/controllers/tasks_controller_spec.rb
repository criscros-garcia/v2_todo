require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  login_user

  scenario 'Invalid characters in the description' do
    list = subject.current_user.lists.new(name: '.$%&-')
    list.valid?
    task = list.tasks.new(description: '&%$sdcs')
    task.valid?
    expect(task.errors[:description]).to include('letters and numbers are just allowed')
  end


end
