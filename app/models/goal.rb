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

class Goal < ApplicationRecord
  validates :user, :goal_body, :private_or_public, :progress, presence: true
  validates :progress, inclusion: 0..100
  belongs_to :user

  def completed?
    progress == 100 ? true : false
  end
end
