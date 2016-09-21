FactoryGirl.define do
  factory :user do

    sequence :email do |n|
      "person#{n}@example.com"
    end
    password '12345678'
    password_confirmation '12345678'
    confirmed_at Date.today

    trait :user do
      email 'user@gmail.com'
    end

  end
end
