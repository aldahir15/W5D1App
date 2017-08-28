# == Schema Information
#
# Table name: goals
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  goal_body         :string
#  private_or_public :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  progress          :integer
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:goal_body) }
    it { should validate_presence_of(:private_or_public) }
    it { should validate_presence_of(:progress) }
    it { should belong_to(:user) }
    it { should validate_inclusion_of(:progress).in_range(0..100) }
  end

  describe "#completed?" do
    it "should return false if progress < 100" do
      goal = Goal.new(user_id: 1, goal_body: 'Finishing this project', private_or_public: 'Public', progress: 20 )
      expect(goal.completed?).to be false
    end

    it "should return true if progress == 100" do
      goal = Goal.new(user_id: 1, goal_body: 'Finishing this project', private_or_public: 'Public', progress: 20 )
      goal.progress = 100
      expect(goal.completed?).to be true
    end
  end

end
