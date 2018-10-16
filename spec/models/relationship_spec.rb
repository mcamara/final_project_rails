require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  describe "validation of relationship between two users" do
    before do
      create(:relationship) { create(:relationship, follower: user1, followed: user2) }
    end

    it "should be valid" do
      relationship = Relationship.new(follower: user1, followed: user2)
      expect(relationship).to be_valid
    end

    it "should require a follower_id" do
      relationship = Relationship.new(follower: user1, followed: user2)
      relationship.follower_id = nil
      expect(relationship).to_not be_valid
    end

    it "should require a followed_id" do
      relationship = Relationship.new(follower: user1, followed: user2)
      relationship.followed_id = nil
      expect(relationship).to_not be_valid
    end
  end
end
