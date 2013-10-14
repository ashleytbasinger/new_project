require 'spec_helper'

describe Timeline do
  it { should have_valid(:title).when("Seymour", "Ashley's Fly Trap") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should belong_to :user }

  it { should have_many :photos }
  it { should have_many :comments}
end
