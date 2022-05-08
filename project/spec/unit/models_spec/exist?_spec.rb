require_relative "../modelspec_helper"

RSpec.describe User do
  
  describe "#exist?" do
    context "It will return the password" do
      it "return test123" do
        #resetting the database before the first test starts
        DB.from("users").delete
        user = described_class.new(username: "test1001", password: "test123")
        user.save_changes
        expect(user.exist?).to eq("test123")
      end
    end
         
  end
end

=begin

      context "Inserting second data that is same as the first one" do
        it "return true" do
          #this user will be a new data
          user = described_class.new(username: "test1001", password: "test123")
          user.save_changes
          expect(user.exist?).to eq(true)
          
        end 
      end 
=end