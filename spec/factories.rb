FactoryGirl.define do
  factory :user do
    username "username"
    email "user@example.com"
    password "password"
  end
end

FactoryGirl.define do
  factory :timeline do
    title "new timeline"
  end
end

FactoryGirl.define do 
  factory :photo do 
    title "flytrap1"
    photo Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'images', 'flytrap1.jpg'))
    occurred_at "2013, October, 1"
    user
  end
end

FactoryGirl.define do
  factory :comment do 
    comment "It's so green!"
  end
end