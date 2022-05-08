#require_relative "../spec_helper"

#describe " the signupmentee page" do
#    it "is accessible from the signin page" do
#        visit "/signin"
#        click_button "Mentee"
#        expect(page).to have_content "Create Mentee"
#    end
    
#   it "will not add a mentee with no details" do
#       visit "/signupmentee"
#       click_button "Submit"
#       expect(page).to have_content "Please fill in this field"
#    end
    
#    it "adds a mentee when all details are entered" do
#       add_test_mentee
#       expect(page).to have_content "Mentee Test"
#       clear_database
#    end
#end