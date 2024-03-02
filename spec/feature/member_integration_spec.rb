require 'rails_helper'

RSpec.feature "MemberFeatures", type: :feature do
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

  scenario "List all members" do
    visit members_path

    expect(page).to have_content(@member1.first_name)
    expect(page).to have_content(@member1.last_name)
  end

  scenario "View a member's details" do
    visit member_path(@member1)

    expect(page).to have_content(@member1.first_name)
    expect(page).to have_content(@member1.last_name)
    expect(page).to have_content(@member1.email)
  end

  scenario "Update a member's information" do
    save_page
    visit edit_member_path(@member1)

    fill_in "member[res_lab]", with: "Lab A"
    click_button "Update Profile"

    expect(page).to have_content("Member was successfully updated")
    expect(page).to have_content("Lab A")
  end

  scenario "Delete a member" do
    visit delete_confirmation_member_path(@member1)
    expect(page).to have_content(@member1.first_name)

    click_button("Delete this member")

    expect(page).to have_content("Member was successfully deleted.")
    expect(page).not_to have_content(@member1.first_name)
  end
end
