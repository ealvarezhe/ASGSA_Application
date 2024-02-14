require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:valid_event) { Event.create!(
    name: "Test Event",
    location: "College Station",
    start_time: Time.now + 2.hour,
    end_time: Time.current,
    date: Date.today,
    description: "This is a description for test event",
    capacity: 20,
    points: 3
  ) }
  #Define a valid member
  let(:valid_attributes){
    {
      description: "A test description",
      send_time: Time.new(),
      send_date: Date.today,
      is_sent: false,
      event_id: valid_event.id
    }
  }

  context 'validations' do
    it 'is valid with valid attributes' do
      notification = Notification.new(valid_attributes)

      expect(notification).to be_valid
    end

    it 'is not valid without a send time' do
      invalid_attributes = valid_attributes.merge(send_time: nil)
      notification = Notification.new(invalid_attributes)
      expect(notification).not_to be_valid
    end

    it 'is not valid without a send date' do
      invalid_attributes = valid_attributes.merge(send_date: nil)
      notification = Notification.new(invalid_attributes)
      expect(notification).not_to be_valid
    end

    it 'is not valid withput a description' do
      notification = Notification.new(valid_attributes.merge(description: nil))
      expect(notification).not_to be_valid
    end
  end
end
