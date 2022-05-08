require_relative "../modelspec_helper"

RSpec.describe User do
    
  describe "#get_request" do
      context "Inserting a new user without an outgoing request" do
          it "returns 0" do
              DB.from("users").delete
              user = described_class.new(outgoing_request: 0)
              user.save_changes
              expect(user.get_request).to eq(0)
              DB.from("users").delete
          end
      end
      
      context "Inserting a new user with an outgoing request" do
          it "returns 1" do
              DB.from("users").delete
              user = described_class.new(outgoing_request: 1)
              user.save_changes
              expect(user.get_request).to eq(1)
              DB.from("users").delete
          end
      end
  end
end