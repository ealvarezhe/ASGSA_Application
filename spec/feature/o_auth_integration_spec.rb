require 'rails_helper'

RSpec.describe "Google Omniauth", type: :feature do
  before do
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
  
  scenario "Member View" do
    expect(page).to have_content("Successfully authenticated from Google account")
    expect(page).to have_content("Role Management")
    expect(page).to have_content("Role Views")
  end
end