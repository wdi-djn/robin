require 'rails_helper'

describe GiftsController do
	
	describe 'GET #index' do
		it "populates an array with all the gifts" do
		 gift1 = FactoryGirl.create(:gift)
		 gift2 = FactoryGirl.create(:gift)
		 get :index
		 expect(assigns(:gifts)).to contain_exactly(gift1, gift2)
		end
		it "renders the gift index" do 
		get :index
		expect(response).to render_template :index
		end
	end

	describe 'GET #show' do
		it "assigns the requested contact to @user" do 
		gift = FactoryGirl.create(:gift)
		get :show, id: gift
		expect(assigns(:gift)).to eq gift
		end
		it "renders the :show template" do
		gift = FactoryGirl.create(:gift)
		get :show, id: gift
		expect(response).to render_template :show
		end
	end

	# describe 'GET #new' do
	# 	it "assigns a new gift to @gift if logged in" do 
	# 		@user = FactoryGirl.create(:user)
 #    		if sign_in(@user) do
	# 		get :new
	# 		expect(assigns(:gift).to be_a_new(Gift)
	# 		end
	# 	end
	# 	it "renders the :new gift template" do
	# 		get :new
	# 		expect(response).to render_template :new
	# 	end
	# end

	# describe 'GET #edit' do
	# 	it "assigns the requested gift to @gift"
	# 	it "renders the :edit gift template"
	# end

	# describe 'POST #create' do
	# 	it "saves a new gift in the database"
	# end

	# describe 'PATCH #update' do
	# 	it "updates the gift in the database"
	# end

	# describe 'DELETE #destroy' do
	# 	it "deletes the gift from the database" 
	# end

end
