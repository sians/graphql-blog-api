FactoryBot.define do
  factory :comment do
    sequence(:text) { |n| "Comment Text Number #{n}" }
  end
end
