require 'rails_helper'

RSpec.describe "member_notifications/new", type: :view do
  before(:each) do
    assign(:member_notification, MemberNotification.new(
      member_id: 1,
      notification_id: 1,
      seen: false
    ))
  end

  it "renders new member_notification form" do
    render

    assert_select "form[action=?][method=?]", member_notifications_path, "post" do

      assert_select "input[name=?]", "member_notification[member_id]"

      assert_select "input[name=?]", "member_notification[notification_id]"
    end
  end
end
