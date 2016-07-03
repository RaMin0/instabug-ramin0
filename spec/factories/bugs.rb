FactoryGirl.define do
  factory :bug do
    app
    status   { Bug.statuses.keys.sample }
    priority { Bug.priorities.keys.sample }
  end
end
