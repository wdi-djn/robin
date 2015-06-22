FactoryGirl.define do

  factory :contribution do
    association :user
    association :gift
    amount { ((1000.0) * rand).round(2) }
  end

end
