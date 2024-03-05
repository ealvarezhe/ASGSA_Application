require 'rails_helper'

RSpec.feature "EventsFeature", type: :feature do
  before do
    Rails.application.load_seed

    # Setup mock OmniAuth user
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123456789',
      info: {
        email: "john@tamu.edu",
        first_name: "John",
        last_name: "Doe",
        image: "https://example.com/image.jpg"
      },
      credentials: {
        token: "token",
        refresh_token: "refresh token",
        expires_at: DateTime.now,
      }
    })

    @member1 = create(:member, :admin)

    # Route to trigger the OmniAuth callback directly for testing
    visit member_google_oauth2_omniauth_callback_path
  end

    let(:new_event) {
        {
        name: "Events integration Test",
        location: "1234 Fake Street",
        start_time: Time.current,
        end_time: Time.current + 2.hour,
        date: Date.today,
        capacity: 40,
        points: 5,
        contact_info: "You can contact FakeUser@tamu.edu",
        description: "This is a description for test event"
        }
    }

  scenario "Create an event" do
    visit new_event_path

    fill_in "Name", with: "Events integration Test"
    fill_in "Location", with: "1234 Fake Street"
    fill_in "Start Time", with: Time.current
    fill_in "End Time", with: Time.current + 2.hour
    fill_in "Date", with: Date.today
    fill_in "Capacity", with: "40"
    fill_in "Points", with: "5"
    # fill_in "Contact Information", with: "You can contact FakeUser@tamu.edu"
    fill_in "Description", with: "This is a test for the events integration test"

    click_button "Create Event"

    expect(page).to have_content("Event was successfully created")
    expect(page).to have_content("Events integration Test")
  end

#   scenario "View events list" do
#     # Create some events to test against
#     # event1 = create(:event, name: "Event 1")
#     # event2 = create(:event, name: "Event 2")

#     visit events_path

#     expect(page).to have_content("Events Integration Test")
#     # expect(page).to have_content(event2.name)
#   end

#   scenario "View event details" do
#     event = create(:event, name: "Test Event")

#     visit event_path(event)

#     expect(page).to have_content(event.name)
#     expect(page).to have_content(event.location)
#     # Add other expectations for event details
#   end


#   scenario "Update event details" do
#     event = create(:event, name: "Test Event", location: "Old Location")

#     visit edit_event_path(event)

#     fill_in "event_location", with: "Updated Location"
#     # Update other fields as needed

#     click_button "Update Event"

#     expect(page).to have_content("Event was successfully updated")
#     expect(page).to have_content("Updated Location")
#     # Add other expectations for the updated event
#   end

  scenario "Delete an event" do

    event = Event.new(new_event)
    event.save
    visit event_path(event)
    click_link "Delete Event"
    click_button "Delete this event"

    expect(page).to have_content("Event was successfully deleted.")
    # expect(page).not_to have_content("Event to Delete")
  end
end
