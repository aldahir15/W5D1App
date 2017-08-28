require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  describe "Require Login" do
    it "should require a login" do
      get :index
      expect(response).to redirect_to(new_session_url)
    end
  end

  describe "GET #index" do
    it "should render :index template of your goals and other public ones" do
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
      post :create, params: { goal: { user_id: 1, goal_body: 'Finishing this project', private_or_public: 'Public', progress: -10  }}
      expect(response).to render_template(:new)
    end

    it "should create a new goal if valid" do
      post :create, params: { goal: { user_id: 1, goal_body: 'Finishing this project', private_or_public: 'Public', progress: 20  }}
      expect(response).to redirect_to(goals_url)
    end
  end
end
