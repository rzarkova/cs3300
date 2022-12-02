require 'rails_helper'

RSpec.feature "User", type: :feature do
    it "Create new User" do
      visit new_user_registration_path
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "qwerty"
      fill_in "user_password_confirmation", with: "qwerty" 
      click_button "sign_up_button"
      expect(page).to have_content("Projects")
    end
    it "fail at new user" do
        visit new_user_registration_path
       
        fill_in "user_email", with: "test-gmail.com"
           
        click_button "sign_up_button"
        expect(page).to have_content("errors prohibited this user from being saved")
      end
      it "visits forgot password page" do
        visit new_user_session_path
        expect(page).to have_content("Log in")  
        click_link "Forgot Your Password" 
        expect(page).to have_content("Forgot Your Password") 
      end
end
