require_relative "../modelspec_helper"

RSpec.describe User do

  describe "#set_email" do
    context "Inserting a new user data with an email" do
      it "returns the created email TestUser@example.com" do
        #resetting the database before the first test starts
        DB.from("users").delete
        user = described_class.new(username: "TestUser", email:"TestUser@example.com")
        user.save_changes
        expect(user.email).to eq("TestUser@example.com")  
      end
    end
    
    #User[1] was created in previous context and the data is not deleted
    context "Testing the change_email for User[1]" do
      it "returns User[1] with a changed email" do
        User[1].set_email("ADifferentEmail@example.com")
        expect(User[1].email).to eq("ADifferentEmail@example.com")
        DB.from("users").delete
      end
    end
    
    context "Inserting multiple users" do
      it "returns changed email correctly for selected user" do
        user = described_class.new(username: "Test1", email:"Test1@example.com")
        user.save_changes
        user = described_class.new(username: "Test2", email:"Test2@example.com")
        user.save_changes
        user = described_class.new(username: "Test3", email:"Test3@example.com")
        user.save_changes

        expect(User[username: "Test2"].email).to eq("Test2@example.com")
        User[username: "Test2"].set_email("AVeryDifferentEmail@example.com")
        expect(User[username: "Test2"].email).to eq("AVeryDifferentEmail@example.com")
        DB.from("users").delete
      end
    end
    
    context "Inserting a new user data without email" do
      it "return nil" do
        user = described_class.new(username: "NewTestUser")
        user.save_changes
        expect(user.email).to eq(nil)
      end
    end
    
    #data from context above is not deleted
    context "Changing the user that has no email" do
      it "return new email" do
        #User[1] is same as User[username: "NewTestUser"]
        User[username: "NewTestUser"].set_email("NewTestUser@example.com")
        expect(User[username: "NewTestUser"].email).to eq("NewTestUser@example.com")
        expect(User[1].email).to eq("NewTestUser@example.com")
        DB.from("users").delete
      end
    end
  end
end