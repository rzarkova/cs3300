require 'rails_helper'

RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    visit root_path
    expect(page).to have_text("Projects")
    expect(page).to have_link("New project")
  end
end
