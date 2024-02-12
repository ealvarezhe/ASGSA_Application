require 'rails_helper'

RSpec.describe 'Creating a Role', type: :feature do
  scenario 'valid inputs' do
    visit new_role_path
    fill_in "role[name]", with: 'Admin'
    fill_in "role[permissions]", with: 'all'
    click_on 'Create Role'
    visit roles_path
    expect(page).to have_content('1')
    expect(page).to have_content('Admin')
    expect(page).to have_content('all')
  end
end

RSpec.describe 'Creating a Role with blank fields', type: :feature do
    scenario 'valid inputs' do
        visit new_role_path
        click_on 'Create Role'
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Permissions can't be blank")
    end
end

RSpec.describe 'creating a role and checking database', type: :request do
    describe 'POST /roles' do
        it 'creates a role with name and permissions' do
            post '/roles', params: { role: { name: "Admin", permissions: "all" } }
            expect(response).to have_http_status(:found)
            follow_redirect!
            expect(response).to have_http_status(:ok)
            expect(Role.last.name).to eq("Admin")
            expect(Role.last.permissions).to eq("all")
        end
    end
end