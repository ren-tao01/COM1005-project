require_relative "../modelspec_helper"

RSpec.describe User do

  describe "#get_field" do
    context "Inserting a new user data with a field" do
      it "returns Computer Science" do
        #resetting the database before the first test starts
        DB.from("users").delete
        user = described_class.new(field: "Computer Science")
        user.save_changes
        expect(user.get_field).to eq("Computer Science")
        DB.from("users").delete
      end
    end
      
    context "Inserting mutliple user data with different field" do    
      it "returns Engineering" do
        user3 = described_class.new(username: "abcd123", field: "Engineering")
        user3.save_changes
        user4 = described_class.new(username: "abcd124", field: "Business")
        user4.save_changes
        user5 = described_class.new(username: "abcd125", field: "Computer Science")
        user5.save_changes
        user6 = described_class.new(username: "abcd126", field: "Computer Science")
        user6.save_changes
        expect(user3.get_field).to eq("Engineering")
        expect(user4.get_field).to eq("Business")
        expect((user6.get_field)&&(user5.get_field)).to eq("Computer Science")
        DB.from("users").delete   
      end
    end
    
    context "Inserting a new user data with empty field" do    
      it "returns nothing" do
        user = described_class.new(field: "")
        user.save_changes
      
        expect(user.get_field).to eq("")
        DB.from("users").delete   
      end
    end
    
    context "Inserting a new user data with empty field" do    
      it "returns nil" do
        user = described_class.new()
        user.save_changes
        expect(user.get_field).to eq(nil)
        DB.from("users").delete   
      end
    end
  end
end