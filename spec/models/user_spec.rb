require "rails_helper"

describe User, type: :model do
  describe "validations" do
    context "without an email" do
      it "is invalid without an email" do
        user = User.create(name: "test", email: nil)
        expect(user).to be_invalid
      end
    end

    context "without an name" do
      it "is invalid without an email" do
        user = User.create(name: "", email: "test@test.com")
        expect(user).to be_invalid
      end
    end
    
    context "when there are duplicate emails" do
      it "is invalid" do
        user = User.create(name: "test", email: "test@test.com")
        invalid_user = User.create(name: "test", email: "test@test.com")
        expect(invalid_user).to be_invalid
      end
    end
  
  end
end
