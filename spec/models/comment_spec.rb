require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "comment should belong to a user and a photo and has a body" do
    it "user should be valid" do
      comment = Comment.new(user_id: '')
      expect(comment).to_not be_valid
    end

    it "photo should be valid" do
      comment = Comment.new(photo_id: '')
      expect(comment).to_not be_valid
    end

    it "body should be included" do
      comment = Comment.new(body: '')
      expect(comment).to_not be_valid
    end
  end
end
