require 'spec_helper'

describe Photo do
  it { should validate_presence_of :title }
  it { should validate_presence_of :date }
  it { should validate_presence_of :image }

  it { should belong_to :user }
  it { should belong_to :timeline }

  it { should have_many :comments}
end
