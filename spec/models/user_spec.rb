require "rails_helper"

RSpec.describe User, type: :model do
  context "validations tests" do
    it "ensures the title is present" do
      user = User.new(email: "test@gmail.com")
      expect(user.valid?).to eq(false)
    end
    it "should be able to save user" do
      user = User.new(email: "test@gmail.com", password: "qwerty")
      expect(user.save).to eq(true)
    end
  end
    context "scopes tests" do
      let(:params) { { email: "test@gmail.com", password: "qwerty" } }
      before(:each) do
        User.create(params)
        User.create(params)
      end
  
      it "should return all projects" do
        expect(User.count).to eq(1)
      end
    end  
  end