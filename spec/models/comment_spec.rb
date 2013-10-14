require 'spec_helper'

describe Comment do
  it { should have_valid(:content).when("This is awesome!", "Wow!", "It's so green") }
  it { should_not have_valid(:content).when(nil, '') }

  it { should belong_to :user }
  it { should belong_to :timeline }
  it { should belong_to :photo }
end
