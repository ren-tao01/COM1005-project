require_relative "../modelspec_helper"

RSpec.describe User do

  describe "#get_university" do 
    context "Inserting a user with a university" do
      it "returns Sheffield" do
        #resetting the database before the first test starts
        DB.from("users").delete
        user = described_class.new(university: "Sheffield")
        user.save_changes
        expect(user.get_university).to eq("Sheffield")
        DB.from("users").delete
      end
    end
    
    context "Inserting a user with no university" do
      it "returns nil" do
        user = described_class.new(username: "monkey")
        user.save_changes
        expect(user.get_university).to eq(nil)
        DB.from("users").delete
      end
    end
   
    context "Inserting multiple user with a university" do
      it "returns one of the user's university" do
        user = described_class.new(username: "monkey", university: "Oxford")
        user.save_changes
        user = described_class.new(username: "horse", university: "Surrey")
        user.save_changes
        user = described_class.new(surname: "Yang", university: "London")
        user.save_changes
        expect(User[1].university).to eq("Oxford")
        expect(User[username: "monkey"][:university]).to eq("Oxford")
      end
    end
    
    context "Getting one existing user's university" do
      it "returns London" do
        expect(User[surname: "Yang"][:university]).to eq("London")
        DB.from("users").delete
      end
    end
  end
end