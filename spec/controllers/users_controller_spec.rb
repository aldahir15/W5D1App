require 'rails_helper'
begin
  UsersController
rescue
  UsersController = nil
end

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "should render :new template" do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "should render :new template" do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "should redirect to new if invalid" do
      post :create, params: { user: { username: 'jay', password: '' }}
      expect(response).to render_template(:new)
    end

    it "should create a new user if valid" do
      post :create, params: { user: { username: 'jay', password: 'password' }}
      expect(response).to redirect_to(users_url)
    end
  end


end
