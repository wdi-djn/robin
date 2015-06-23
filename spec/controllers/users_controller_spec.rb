require 'rails_helper'

describe UsersController do

	describe 'GET #index' do
		it "populates an array with all the users" do
			user1 = FactoryGirl.create(:user)
			user2 = FactoryGirl.create(:user)
			get :index
			expect(assigns(:users)).to contain_exactly(user1, user2)
		end
		it "renders the index" do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #show' do
	    it "assigns the requested contact to @user" do
	    user = FactoryGirl.create(:user)
	    get :show, id: user
	    expect(assigns(:user)).to eq user
	    end
	    it "renders the :show template" do
	    user = FactoryGirl.create(:user)
	    get :show, id: user
	    expect(response).to render_template :show
	    end
	end

	describe 'GET #new' do
	    it "assigns a new user to @user" do
	    	get :new
	    	expect(assigns(:user)).to be_a_new(User)
	    end
	    it "renders the :new template" do
	    	get :new
	    	expect(response).to render_template :new
	    end
	end

	describe 'GET #edit' do
	    it "assigns the requested user to @user" do
	    user = FactoryGirl.create(:user)
	    get :edit, id: user
	    expect(assigns(:user)).to eq user
	end
	    it "renders the :edit template" do
	    user = FactoryGirl.create(:user)
	    get :edit, id: user
	    expect(response).to render_template :edit
		end
	end

	describe 'POST #create' do
	    it "saves a new user in the database"  do
	    post :create, user: FactoryGirl.attributes_for(:user)
	    expect(User.count).to eq(1)
		end
	end

	describe 'PATCH #update' do
		before :each do
			@user = FactoryGirl.create(:user, first_name: "Jeremy", last_name: "Brenner")
		end

	    it "updates the user in the database" do 
	    	patch :update, id: @user, user: FactoryGirl.attributes_for(:user)
	    	expect(assigns(:user)).to eq(@user)
	    end
	end

	describe 'DELETE #destroy' do
		it "deletes the user from the database" do
			user = FactoryGirl.create(:user)
			delete :destroy, id: user
			expect(User.all.count).to eq(0)
		end
	end

end
