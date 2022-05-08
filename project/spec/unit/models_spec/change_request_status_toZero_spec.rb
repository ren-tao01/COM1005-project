require_relative "../modelspec_helper"

RSpec.describe User do
    
  describe "#change_request_status_toOne" do
      context "Changing an inserted users request sent to sent" do
          it "returns 1" do
              DB.from("users").delete
              user = described_class.new(outgoing_request: 1)
              user.save_changes
              user.change_request_status_toZero
              expect(user.get_request).to eq(0)
              DB.from("users").delete
          end
      end
  end
end