require_relative "../modelspec_helper"

RSpec.describe User do

  describe "#set_username" do 
    context "Inserting a user with a username" do
      it "returns Computer Science" do
        #resetting the database before the first test starts
        DB.from("users").delete
        user = described_class.new(username: "yehia444")
        user.save_changes
        expect(user.username).to eq("yehia444")
      end
    end
    
    context "Setting the user with a different username" do
      it "returns a different field" do
        #resetting the database before the first test starts
        User[1].set_username("pigeon23")
        expect(User[1].username).to eq("pigeon23")
        DB.from("users").delete
      end
    end
  end
end