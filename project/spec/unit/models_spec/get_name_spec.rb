require_relative "../modelspec_helper"

RSpec.describe User do
  
  describe "#get_name" do
    context "Inserting a new user data with first_name and surname" do
      it "returns Kim Jones" do
        #resetting the database before the first test starts
        DB.from("users").delete
        user = described_class.new(first_name: "Kim", surname: "Jones")
        user.save_changes
        expect(user.get_name).to eq("Kim Jones")
        DB.from("users").delete
      end
    end
    
    context "Inserting a new user data with first_name only" do
      it "returns Kim" do
        user = described_class.new(first_name: "Kim")
        user.save_changes
        expect(user.get_name).to eq("Kim")
        DB.from("users").delete
      end
    end
    
    context "Inserting a new user data without first_name and surname" do
      it "returns empty string" do    
        user = described_class.new(username: "hellotest")
        user.save_changes
        expect(user.get_name).to eq("")
        DB.from("users").delete
      end
    end
    
    context "Empty database" do
      it "raises error" do
        #Inserted 1 data and removed 1 before expecting the results
        user = described_class.new(username: "hellotest")
        user.save_changes
        DB.from("users").delete
        #No data so no method can be initialised
        expect{Object.get_name}.to raise_error(NoMethodError)
      end
    end
    
    context "Empty database" do
      it "raises error" do    
        expect{Object.get_name}.to raise_error(NoMethodError)
      end
    end
    
  end
end