FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

    trait :judge do
      role 'judge'
    end

    trait :manager do
      role 'manager'
    end

  end
end
