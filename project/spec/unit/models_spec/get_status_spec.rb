require_relative "../modelspec_helper"

RSpec.describe User do
  
  describe "#get_status" do
    context "Inserting a new user data pairing_status 1" do
      it "return 1 and PAIRED" do
        #resetting the database before the first test starts
        DB.from("users").delete
        #0, "NOT_PAIRED", number=1 => "PAIRED"
        number = 1
        user = described_class.create(pairing_status: number)
        user.save_changes
        pstatus = DB.from("pairing_status")
        expect(user.get_status).to eq(1)
        expect(pstatus[id: number][:status]).to eq("PAIRED")
        DB.from("users").delete
      end
    end
    
    context "Inserting a new user data pairing_status 0 " do
      it "return 0 and NOT_PAIRED" do
        #number=0 => "NOT_PAIRED"
        number = 0
        user = described_class.create(pairing_status: number)
        user.save_changes
        pstatus = DB.from("pairing_status")
        expect(user.get_status).to eq(0)
        expect(pstatus[id: number][:status]).to eq("NOT_PAIRED")
        DB.from("users").delete
      end
    end
    
    context "Inserting a new user data with no pairing_status" do
      it "return nil" do
        user = described_class.new()
        user.save_changes
        expect(user.get_status).to eq(nil)
        DB.from("users").delete
      end
    end
  end
end