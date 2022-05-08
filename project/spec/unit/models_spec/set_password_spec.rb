require_relative "../modelspec_helper"

RSpec.describe User do

  describe "#set_password" do
    context "Inserting a new user data with a password" do
      it "returns the created password \"rus13\"" do
        #resetting the database before the first test starts
        DB.from("users").delete
        user = described_class.new(username: "putin1001", password:"rus13")
        user.save_changes
        expect(user.password).to eq("rus13")  
      end
    end
    
    #User[1] was created in previous context and the data is not deleted
    context "Testing the change_password for User[1]" do
      it "returns User[1]'s changed password'" do
        User[1].set_password("Qwer421")
        expect(User[1].password).to eq("Qwer421")
        DB.from("users").delete
      end
    end
    
    context "Inserting multiple users" do
      it "returns changed password correctly for selected user" do
        user = described_class.new(username: "cat1001", password:"1cat")
        user.save_changes
        user = described_class.new(username: "dog1001", password:"1dog")
        user.save_changes
        user = described_class.new(username: "bird1001", password:"1bird")
        user.save_changes

        expect(User[username: "cat1001"].password).to eq("1cat")
        User[username: "cat1001"].set_password("CAT001")
        expect(User[username: "cat1001"].password).to eq("CAT001")
        DB.from("users").delete
      end
    end
    
    context "Inserting a new user data without password" do
      it "return nil" do
        user = described_class.new(username: "putin1001")
        user.save_changes
        expect(user.password).to eq(nil)
      end
    end
    
    #data from context above is not deleted
    context "Changing the user that has no password" do
      it "return nil" do
        #User[1] is same as User[username: "putin1001"]
        User[username: "putin1001"].set_password("Hello")
        expect(User[username: "putin1001"].password).to eq("Hello")
        expect(User[1].password).to eq("Hello")
        DB.from("users").delete
      end
    end
  end
end
       