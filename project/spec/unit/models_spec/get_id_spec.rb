require_relative "../modelspec_helper"

RSpec.describe User do

  describe "#get_id" do 
    context "Inserting 1 data into the database but did not remove it" do
      it "returns 1" do
        #resetting the database before the first test starts
        DB.from("users").delete
        user = described_class.new(username: "hellotest")
        user.save_changes
        expect(user.get_id).to eq(1)   
      end
    end
    
    context "Inserting 1 more data, new user's id will +=1, in this case it will be 2" do
      it "returns 2" do
        #this user will be a new data
        user = described_class.new
        user.save_changes
        #user.id is the user's id so it is the result returned by get_id
        expect(user.id && user.get_id).to eq(2)
        DB.from("users").delete
      end
    end
    
    context "Setting new user's id to 409" do
      it "returns 409" do
        user = described_class.new
        user.id = 409
        user.save_changes
        expect(user.get_id).to eq(409)
        DB.from("users").delete
      end
    end
    
    context "Inserting 1 data into the database and removing it" do
      it "returns 1" do
        user = described_class.new
        user.save_changes
        expect(user.id && user.get_id).to eq(1)
        DB.from("users").delete
      end
    end
    
    context "Inserting 5 datas into the database and removing them" do
      it "returns 1" do
        user = described_class.new(username: "hellotest")
        user.save_changes
        user = described_class.new(username: "hellotest2")
        user.save_changes
        user = described_class.new(username: "hellotest3")
        user.save_changes
        user = described_class.new(username: "hellotest4")
        user.save_changes
        user = described_class.new(username: "hellotest5")
        user.save_changes
        expect(user.get_id).to eq(5)
        DB.from("users").delete
      end
    end
    
  end

  
end
