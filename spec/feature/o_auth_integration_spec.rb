require 'rails_helper'

RSpec.describe "Google Omniauth", type: :feature do
  before do
    Rails.application.load_seed
  end
  
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

  let(:admin_member) { create(:member, :admin) }
  let(:officer_member) { create(:member, :officer) }
  let(:regular_member) { create(:member) }

  before do
    sign_in admin_member
    visit member_google_oauth2_omniauth_callback_path
    click_button "Update Profile"
    visit member_roles_path
    find('#edit_button_1').click
    select 'Admin', from: 'member_role_id'
    click_button "Update Member's Role"
  end

  scenario "Admin View" do
    expect(page).to have_content("Members")
    expect(page).to have_content("Events")
    expect(page).to have_content("Role Management")
    expect(page).to have_content("Roles")
  end
  
end