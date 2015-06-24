FactoryGirl.define do

  # a factory for a gift without an associated user
  factory :gift do
  	title { FFaker::Lorem.sentence(5)}
  	description { FFaker::Lorem.paragraph}
  	price { ((1000.0) * rand).round(2) }
  	gift_url { FFaker::Internet.http_url}
  	due_date { FFaker::Time.date}
  	recipient { FFaker::Name.name}
  	hashed_id { gift_url }
  end

  # a factory for a gift that already has relationship to a user
  factory :gift_with_user, parent: :gift do
  	association :user
  	title { FFaker::Lorem.sentence(5)}
  	description { FFaker::Lorem.paragraph}
  	price { ((1000.0) * rand).round(2) }
  	gift_url { FFaker::Internet.http_url}
  	due_date { FFaker::Time.date}
  	recipient { FFaker::Name.name}
  	hashed_id { gift_url }
  end


end
