require 'rails_helper'

RSpec.describe "Google Omniauth", type: :request do
  it "can sign in with Google account" do
    get '/members/auth/google_oauth2'
    expect(response).to redirect_to('/members/auth/google_oauth2/callback')

    follow_redirect!

    expect(response).to redirect_to(root_path)
    follow_redirect!

    expect(response.body).to include('Successfully authenticated from Google account.')
    expect(response.body).to include('mockuser')
  end
end