require_relative "../modelspec_helper"

RSpec.describe User do
  
  describe "#get_role" do
    context "Inserting a new user data with role Mentor" do
      it "return 1 and Mentor" do
        #resetting the database before the first test starts
        DB.from("users").delete
        #number=1 => "Mentor"
        number = 1
        user = described_class.new(role: number)
        user.save_changes
        r_ole = DB.from("roles")
        expect(user.get_role).to eq(1)
        expect((r_ole[id: number])[:role]).to eq("Mentor")
        DB.from("users").delete
      end
    end
    
    context "Inserting a new user data with role Mentee" do
      it "return 2 and Mentee" do
        #number=2 => "Mentee"
        number = 2
        user = described_class.new(role: number)
        user.save_changes
        r_ole = DB.from("roles")
        expect(user.get_role).to eq(2)
        expect((r_ole[id: number])[:role]).to eq("Mentee")
        DB.from("users").delete
      end
    end
    
    context "Inserting a new user data with role Admin" do
      it "return 0 and Admin" do
        #number=0 => "Admin"
        number = 0
        user = described_class.new(role: number)
        user.save_changes
        r_ole = DB.from("roles")
        expect(user.get_role).to eq(0)
        expect((r_ole[id: number])[:role]).to eq("Admin")
        DB.from("users").delete
      end
    end
    
    context "Inserting a new user data with no role" do
      it "return nil" do
        user = described_class.new()
        user.save_changes
        expect(user.get_role).to eq(nil)
        DB.from("users").delete
      end
    end
  end
end