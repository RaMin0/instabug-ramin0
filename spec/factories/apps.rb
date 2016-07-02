FactoryGirl.define do
  factory :app do
    name { FFaker::Company.name }
  end
end
