#require_relative "../spec_helper"

#describe " the signupmentor page" do
#    it "is accessible from the signin page" do
#        visit "/signin"
#        click_button "Mentor"
#        expect(page).to have_content "Create Mentor"
#    end
    
#    it "will not add a mentor with no details" do
#       visit "/signupmentor"
#       click_button "Submit"
#       expect(page).to have_content "Please fill in this field."
#    end
    
#    it "adds a mentor when all details are entered" do
#       add_test_mentee
#       expect(page).to have_content "Mentor Test"
#       clear_database
#    end
#end