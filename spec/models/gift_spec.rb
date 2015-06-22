require 'rails_helper'

describe Gift do

	# checks the factory can build a valid user
	it "factory builds a valid gift" do
		expect(FactoryGirl.build(:gift)).to be_valid
	end

	# checks that a User can make a gift and have it saved on itself
	it "can be made by a user" do
		user = FactoryGirl.create(:user)
		user.gifts.push(FactoryGirl.create(:gift))
		expect(user.gifts.count).to be(1)
	end

	#checks that a gift is associated to a user
	it "is associated with a user" do
		gift = FactoryGirl.create(:gift_with_user)
		user = User.find(gift.user_id)
		expect(user.gifts).to include(gift)
	end

	# validates the gift attributes
	context "when creating gift attributes" do
		it "is invalid without a title" do
			gift = FactoryGirl.create(:gift, title: nil)
			gift.valid?
			expect(gift.errors[:title].count).to eq(1)
		end
		it "is invalid without a description" do
			gift = FactoryGirl.create(:gift, title: nil)
			gift.valid?
			expect(gift.errors[:decription].count).to eq(1)
		end
	end
end
