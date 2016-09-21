FactoryGirl.define do
  factory :title do

    name Faker::Name.name
    association :user, factory: :user

  end
end
