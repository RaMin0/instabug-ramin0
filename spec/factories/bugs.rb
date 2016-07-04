FactoryGirl.define do
  factory :bug do
    app
    status   { Bug::STATUSES.sample }
    priority { Bug::PRIORITIES.sample }
  end
end
