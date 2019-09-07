require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  login_user

  scenario 'Invalid characters in the description' do
    list = subject.current_user.lists.create(name: '.$%&-')
    expect(list.valid?).to be_falsey

    task = list.tasks.new(description: '&%$sdcs')
    expect(task.valid?).to be_falsey

    message = task.errors.full_messages_for(:description).first
    expect(message).to include('just letters and numbers are allowed')
  end
end
