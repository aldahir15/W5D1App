class GoalsController < ApplicationController
  before_action :require_login

  def index
    @goals = Goal.where('private_or_public = public') + Goal.find_by(user_id: current_user.id)
    @goals = @goals.uniq
    render :index
  end

  def new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goals_link
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def goal_params
    params.require(:goal).permit(:goal_body, :progress, :private_or_public)
  end
end
