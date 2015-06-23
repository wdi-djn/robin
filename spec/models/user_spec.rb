
require 'rails_helper'

describe User do

	# checks to see if a valid user can be built
	it "factory builds a valid User" do
		expect(FactoryGirl.build(:user)).to be_valid
	end

	# checks that nil user data is invalid
	context "when user input is nil" do

		it "is invalid without a first_name" do
			user = FactoryGirl.build(:user, first_name: nil)
			user.valid?
			expect(user.errors[:first_name]).to include("can't be blank")
		end

		it "is invalid without a last_name" do
			user = FactoryGirl.build(:user, last_name: nil)
			user.valid?
			expect(user.errors[:last_name]).to include("can't be blank")
		end

		it "is invalid without a username" do
			user = FactoryGirl.build(:user, username: nil)
			user.valid?
			expect(user.errors[:username]).to include("can't be blank")
		end

		it "is invalid without a email" do
			user = FactoryGirl.build(:user, email: nil)
			user.valid?
			expect(user.errors[:email]).to include("can't be blank")
		end

		it "is invalid without a password" do
			user = FactoryGirl.build(:user, password: nil)
			user.valid?
			expect(user.errors[:password]).to include("can't be blank")
		end
	end

	context "when username is created" do
		it "must be unique" do
			FactoryGirl.create(:user, username: "jeremybrenner")
			user = FactoryGirl.build(:user, username: "jeremybrenner")
			user.valid?
			expect(user.errors[:username]).to include("has already been taken")	
		end
	end

	# check email validations, context built for future tests
	context "when user email is created" do
		it "must be unique" do
			FactoryGirl.create(:user, email: "jeremybrenner@gmail.com")
			user = FactoryGirl.build(:user, email: "jeremybrenner@gmail.com")
			user.valid?
			expect(user.errors[:email]).to include("Email already in use")	
		end	

		it "doesnt pass regex if format is invalid" do
			user = FactoryGirl.build(:user, email: "jeremybrenner@@gmail.com")
			user.valid?
			expect(user.errors[:email]).to include("is invalid")
		end	
	end

	# check password validations, context built for future tests
	# note: confirmation is not checked here
	context "when a password is created" do
		it "is invalid if not at least 6 characters long" do
			user = FactoryGirl.build(:user, password: "five")
			user.valid?
			expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
		end
	end

	# testing User relationship to gifts
	context "is related to gifts" do
		it "can have many gifts" do
		user = FactoryGirl.create(:user)
			2.times do
				user.gifts.push(FactoryGirl.create(:gift))
			end
		expect(user.gifts.count).to eq(2)
		end
	end

	# class method testing
	describe ".confirm" do
		it "responds to User class" do
		expect(User).to respond_to(:confirm)
		end
	end

end
