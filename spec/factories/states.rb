FactoryGirl.define do
  factory :state do
    bug
    device  %w[iphone ipad nexus lumia nokia].sample
    os      %w[ios android windows_phone symbian].sample
    memory  512.step(4096, 512).to_a.sample
    storage 512.step(128 * 1024, 512).to_a.sample
  end
end
