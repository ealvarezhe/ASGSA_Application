require 'rails_helper'

RSpec.describe "member_notifications/show", type: :view do
  before(:each) do
    assign(:member_notification, MemberNotification.create!(
      member_id: 2,
      notification_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
