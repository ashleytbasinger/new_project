require 'spec_helper'

describe User do
  it { should have_valid(:username).when('poison_ivy') }
  it { should_not have_valid(:username).when(nil, '') }

  it { should have_valid(:email).when('poison@gmail.com') }
  it { should_not have_valid(:email).when(nil, '') }

  # it { should have_many :timeline_entries }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.username = 'poison_ivy'
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'
  end
end
