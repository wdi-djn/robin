require 'rails_helper'

describe Contribution do

	# checks the factory can build a valid user
	it "factory builds a valid Contribution" do
		expect(FactoryGirl.build(:contribution)).to be_valid
	end

	it "can be created by a user through a gift" do
		gift_with_user = FactoryGirl.create(:gift_with_user)
	end

	# creates a contribution for each test
	before(:each) do
  		@cont = FactoryGirl.create(:contribution)
	end

	# ensures the attributes exist
	context "when checking its attributes" do

		it "has an amount" do 
			expect(@cont.amount).to be_truthy
		end

		it "has a gift_id" do 
			expect(@cont.gift_id).to be_truthy
		end

		it "has a user_id" do
			expect(@cont.user_id).to be_truthy
		end
	end

	# checks a contributions relationships to user and gift
	context "when checking its relationships" do

		# looks at gift_id and compares it to the id of the gift through the contribution
		it "gift_id references a valid gift" do
			expect(@cont.gift_id).to eq(@cont.gift.id)
		end

		# looks at user_id and compares it to the id of the user through the contribution
		it "user_id is references a valid user" do
			expect(@cont.user_id).to eq(@cont.user.id)
		end
	end

end
