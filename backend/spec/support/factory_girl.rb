require 'factory_girl'

FactoryGirl.define do
  factory :joke do
    sequence(:setup) { |n| "Why did the #{n} chickens cross the road?" }
    sequence(:punchline) { |n| "To get to the other side." }
  end
end
