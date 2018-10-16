require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe "photo should belong to a user" do
    it "user should be valid" do
      photo = Photo.new(user_id: '')
      expect(photo).to_not be_valid
    end
  end
end
