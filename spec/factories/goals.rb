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

FactoryGirl.define do
  factory :goal do
    
  end
end
