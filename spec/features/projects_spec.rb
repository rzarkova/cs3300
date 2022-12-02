require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
       "Create new User" 
        visit new_user_registration_path
        visit new_user_registration_path
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "qwerty"
      fill_in "user_password_confirmation", with: "qwerty" 
      click_button "sign_up_button"
      visit new_project_path
      
      fill_in "Title", with: "Test title"
      
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Submit"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Submit"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project - Signed in" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      "Create new User" 
        visit new_user_registration_path
      fill_in "user_email", with: "test@gmail.com"
      fill_in "user_password", with: "qwerty"
      fill_in "user_password_confirmation", with: "qwerty" 
      click_button "sign_up_button"
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      
      fill_in "Description", with: "New description content"
    
      click_button "Submit"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      
      fill_in "Description", with: ""
      
      click_button "Submit"
      expect(page).to have_content("Description can't be blank")
    end

    context "Remove existing project" do
      let!(:project) { Project.create(title: "Test title", description: "Test content") }
      scenario "remove project" do
        visit projects_path
        click_link "Show"
        expect(page).to have_content("Destroy this project")
        click_button "Destroy this project"
        expect(page).to have_content("Project was successfully destroyed")
        expect(Project.count).to eq(0)
      end
    end
    
    context "edit project manually" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
      scenario "edit project" do
        visit projects_path
        expect(page).to have_content("Test title")
        expect(page).to have_content("Test content")
        click_link "Show"
        click_link "Edit"
        
        fill_in "Description", with: "New description content"
        
        click_button "Submit"
        expect(page).to have_content("Project was successfully updated")
        click_link "Back to projects"
      end
      context "signed out" do
        let!(:project) { Project.create(title: "Test title", description: "Test content") }
          before (:each) do
            visit projects_path
            click_button "Sign out"
            click_link "Show"
          end
    
      end
    end
  end
end
