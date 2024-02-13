require 'rails_helper'

RSpec.feature "MemberFeatures", type: :feature do
  before do
    # Manually create members here
    @member1 = Member.create!(
      first_name: "John",
      last_name: "Doe",
      email: "john@example.com",
      points: 0,
      position: "None",
      date_joined: Date.today,
      degree: "Computer Science",
      res_topic: "None",
      res_lab: "None",
      res_pioneer: "None",
      res_description: "None",
      area_of_study: "None",
      food_allergies: "None"
    )
  end

  scenario "Add a new member" do
    visit new_member_path
    fill_in "First name", with: "Jane"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "newmember@example.com"
    fill_in "Points", with: 0
    fill_in "Position", with: "None"
    fill_in "Date joined", with: Date.today
    fill_in "Degree", with: "Computer Science"
    fill_in "Res topic", with: "None"
    fill_in "Res lab", with: "None"
    fill_in "Res pioneer", with: "None"
    fill_in "Res description", with: "None"
    fill_in "Area of study", with: "None"
    fill_in "Food allergies", with: "None"

    # Submit the form
    # Replace 'Create Member' with the actual button text to submit the form
    click_button "Create Member"


    expect(page).to have_content("Member was successfully created")
    expect(page).to have_content("Jane")
    expect(page).to have_content("Doe")
    expect(page).to have_content("newmember@example.com")
    expect(page).to have_content("0")
    expect(page).to have_content(Date.today)
    expect(page).to have_content("Computer Science")
    expect(page).to have_content("None")
    expect(page).to have_content("None")
    expect(page).to have_content("None")
    expect(page).to have_content("None")
    expect(page).to have_content("None")
    expect(page).to have_content("None")
  end

  scenario "List all members" do
    visit members_path

    expect(page).to have_content("John")
    expect(page).to have_content("Doe")
  end

  scenario "View a member's details" do
    visit member_path(@member1)

    expect(page).to have_content("John")
    expect(page).to have_content("Doe")
    expect(page).to have_content("john@example.com")
  end

  scenario "Update a member's information" do
    visit edit_member_path(@member1)

    fill_in "First name", with: "Johnny"
    click_button "Update Member"

    expect(page).to have_content("Member was successfully updated")
    expect(page).to have_content("Johnny")
  end

  scenario "Delete a member" do
    visit delete_confirmation_member_path(@member1)
    expect(page).to have_content(@member1.first_name)

    click_button("Delete this member")

    expect(page).to have_content("Member was successfully deleted")
    expect(page).not_to have_content(@member1.first_name)
  end
end
