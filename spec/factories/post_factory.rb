FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Title Number #{n}" }
    sequence(:published) { |n| nil }
    sequence(:status) { |n| nil }
  end
end
