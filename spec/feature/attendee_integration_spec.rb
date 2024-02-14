require 'rails_helper'

RSpec.feature "Attendee Features", type: :feature do
  before do
    # Manually create event / member here
    @event = Event.create!(
      name: "name",
      location: "location",
      start_time: Time.now,
      end_time: Time.now,
      date: Date.today,
      description: "Sample Description",
      capacity: 100,
      points: 5
    )

    @member = Member.create!(
      first_name: "John",
      last_name: "Doe",
      email: "john.doe@example.com",
      points: 100,
      position: "Member",
      date_joined: Date.today,
      degree: "Bachelor",
      res_topic: "Topic",
      res_lab: "Lab",
      res_pioneer: "Pioneer",
      res_description: "Description",
      area_of_study: "Study Area",
      food_allergies: "None"
    )
  end

  scenario "RSVP for an event" do
    visit event_path(@event)

    expect(page).to have_link("RSVP")
    click_link "RSVP"

    fill_in "attendee_member_id", with: @member.member_id
    click_button "Confirm RSVP"

    expect(page).to have_content("RSVP was successfully created.")
    expect(page).to have_content(@member.first_name)
    expect(page).to have_content(@member.last_name)
    expect(page).to have_content("Check Member In")
  end

  scenario "Check Member In / Out" do
    visit event_path(@event)
    click_link "RSVP"
    fill_in "attendee_member_id", with: @member.member_id
    click_button "Confirm RSVP"

    visit event_attendees_path(@event)

    expect(page).to have_content(@member.first_name)
    expect(page).to have_content(@member.last_name)
    expect(page).to have_content("Check Member In")

    click_link "Check Member In"
    expect(page).to have_content(@member.first_name)
    expect(page).to have_content(@member.last_name)
    expect(page).to have_content("Member is checked in")

    click_link "Uncheck Member"
    expect(page).to have_content(@member.first_name)
    expect(page).to have_content(@member.last_name)
    expect(page).to have_content("Member has not been checked in")
  end

  scenario "Show Attended" do
    visit event_path(@event)
    click_link "RSVP"
    fill_in "attendee_member_id", with: @member.member_id
    click_button "Confirm RSVP"

    visit attended_event_attendees_path(@event)

    visit event_attendees_path(@event)
    click_link "Check Member In"

    visit attended_event_attendees_path(@event)
    expect(page).to have_content(@member.first_name)
    expect(page).to have_content(@member.last_name)
  end

  scenario "Delete Attendee" do
    visit event_path(@event)
    click_link "RSVP"
    fill_in "attendee_member_id", with: @member.member_id
    click_button "Confirm RSVP"

    visit event_attendees_path(@event)
    expect(page).to have_content(@member.first_name)
    expect(page).to have_content(@member.last_name)

    click_link "Delete RSVP"
    expect(page).to have_content("Are you sure you want to delete this RSVP?")
    click_button "Delete RSVP"

    expect(page).to have_content("RSVP was successfully destroyed")
  end

  scenario "Create RSVP Rainy Day" do
    visit new_event_attendee_path(@event)
    fill_in "attendee_member_id", with: @member.member_id
    click_button "Confirm RSVP"

    # Validate that 2 RSVP for the event cannot be created for the same member
    visit new_event_attendee_path(@event)
    fill_in "attendee_member_id", with: @member.member_id
    click_button "Confirm RSVP"
    expect(page).to have_content("RSVP for this event has already been created")

    fill_in "attendee_member_id", with: nil
    click_button "Confirm RSVP"
    expect(page).to have_content("Invalid Member Id")

    fill_in "attendee_member_id", with: "10000"
    click_button "Confirm RSVP"
    expect(page).to have_content("Invalid Member Id")

    fill_in "attendee_member_id", with: "-2"
    click_button "Confirm RSVP"
    expect(page).to have_content("Invalid Member Id")
  end
end
