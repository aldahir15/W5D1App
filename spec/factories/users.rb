FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    passwod { Faker::Name.password }
  end
end
