require_relative "../modelspec_helper"

RSpec.describe User do

  describe "#set_field" do 
    context "Inserting a user with a Computer Science field" do
      it "returns Computer Science" do
        #resetting the database before the first test starts
        DB.from("users").delete
        user = described_class.new(field: "Computer Science")
        user.save_changes
        expect(user.get_field).to eq("Computer Science")
      end
    end
    
    context "Setting the user with a different field" do
      it "returns a different field" do
        #resetting the database before the first test starts
        User[1].set_field("Business")
        expect(User[1].field).to eq("Business")
        DB.from("users").delete
      end
    end
  end
end