require 'rails_helper'

RSpec.describe "Member View", type: :feature do
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
  
    before do
        visit member_google_oauth2_omniauth_callback_path
        click_button "Update Profile"
        visit member_roles_path
        find('#edit_btn').click
        select 'Member', from: 'member_role_id'
        click_button "Update Member's Role"
    end

    scenario "Nav Links" do
        expect(page).to have_content("Members")
        expect(page).to have_content("Events")
        expect(page).to have_no_content("Notifications")
        expect(page).to have_no_content("Role Management")
        expect(page).to have_no_content("Roles")
    end

    scenario "Member can't delete other members" do
        visit members_path
        expect(page).to have_no_css('#delete_btn')
        expect(page).to have_css('#edit_btn', count: 1)
        expect(page).to have_css('#show_btn')
    end

    scenario "Member can edit their own info" do
        visit members_path
        expect(page).to have_css('#edit_btn', count: 1)
    end

    scenario "Member can edit their own info" do
        visit members_path
        expect(page).to have_css('#edit_btn', maximum: 1)
    end

    scenario "Member can view other members" do
        visit members_path
        expect(page).to have_css('#show_btn')
    end

    scenario "Member can't create events" do
        visit events_path
        expect(page).to have_no_css('#create_btn')
    end

    scenario "Member can't delete events" do
        visit events_path
        expect(page).to have_no_css('#delete_btn')
    end

    scenario "Member can't edit events" do
        visit events_path
        expect(page).to have_no_css('#edit_btn')
    end

    scenario "Member can view events" do
        visit events_path
        expect(page).to have_css('#show_btn')
    end
  
end