require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user should have valid username and email" do
    it "username should be valid" do
      user = User.new(username: '')
      expect(user).to_not be_valid
    end

    it "email should be valid" do
      user = User.new(email: '')
      expect(user).to_not be_valid
    end
  end
end
