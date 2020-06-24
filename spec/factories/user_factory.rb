FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    sequence(:password) { |n| "foobar#{n}" }
  end
end
