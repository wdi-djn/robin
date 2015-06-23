FactoryGirl.define do

	# a factory for a user with no gifts
	factory :user do
		first_name { FFaker::Name.first_name }
		last_name { FFaker::Name.last_name }
		username { FFaker::Internet.user_name }
		email { FFaker::Internet.email }
		password { FFaker::Internet.password }
	end
	
end


