# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
    it "password should allow nil" do
      dummy = User.new(username: 'me', password: nil)
      expect(dummy.valid?).to be true
    end
  end

  describe "::find_by_credentials should find a user if
            they match the username and password" do
    it "should return a user if the credentials are valid" do
      dummy = User.create(username: 'me', password: 'password')
      expect(User.find_by_credentials('me', 'password')).to eq(dummy)
    end

    it "should return nil if the credentials are not valid" do
      dummy = User.create(username: 'me', password: 'password')
      expect(User.find_by_credentials('me', 'not_password')).to eq(nil)
    end
  end

  describe "#is_password? checks if password is valid or not" do
    it "should return true if password is the same" do
      dummy = User.new(username: 'me', password: 'password')
      expect(dummy.is_password?('password')).to be true
    end

    it "should return false if password is not the same" do
      dummy = User.new(username: 'me', password: 'not_password')
      expect(dummy.is_password?('password')).to be false
    end
  end


end
