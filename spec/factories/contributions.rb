FactoryGirl.define do

  factory :contribution do
    amount { ((1000.0) * rand).round(2) }
  end

  factory :contribution_user_gift, parent: :contribution do
  	association :user
    association :gift
  	amount { ((1000.0) * rand).round(2) }
  end

end
