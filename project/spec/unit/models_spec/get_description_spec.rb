require_relative "../modelspec_helper"

RSpec.describe User do

  describe "#get_description" do 
    context "Inserting 1 user with a description" do
      it "returns 1" do
        #resetting the database before the first test starts
        DB.from("users").delete
        user = described_class.new(description: "ContexT")
        user.save_changes
        expect(user.get_description).to eq("ContexT")
        DB.from("users").delete
      end
    end
    
  end
end