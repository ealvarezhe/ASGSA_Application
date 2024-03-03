require 'rails_helper'

RSpec.describe "member_notifications/edit", type: :view do
  let(:member_notification) {
    MemberNotification.create!(
      member_id: 1,
      notification_id: 1,
      seen: false
    )
  }

  before(:each) do
    assign(:member_notification, member_notification)
  end

  it "renders the edit member_notification form" do
    render

    assert_select "form[action=?][method=?]", member_notification_path(member_notification), "post" do

      assert_select "input[name=?]", "member_notification[member_id]"

      assert_select "input[name=?]", "member_notification[notification_id]"
    end
  end
end
