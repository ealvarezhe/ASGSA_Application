require 'rails_helper'

RSpec.describe Event, type: :model do

    let(:valid_attributes) {
        {
        name: "Test Event",
        location: "College Station",
        start_time: Time.now + 2.hour,
        end_time: Time.current,
        date: Date.today,
        description: "This is a description for test event",
        capacity: 20,
        points: 3
        }
    }

    context 'validations' do
        it 'Is valid with valid attributes' do
            event = Event.new(valid_attributes)
            expect(event).to be_valid
        end

        it 'Is not valid without name' do
            event = Event.new(valid_attributes.merge(name: nil))
            expect(event).not_to be_valid
        end

        it 'Is not valid without location' do
            event = Event.new(valid_attributes.merge(location: nil))
            expect(event).not_to be_valid
        end

        it 'Is not valid without date' do
            event = Event.new(valid_attributes.merge(date: nil))
            expect(event).not_to be_valid
        end

        it 'Is not valid with negative capacity' do
            event = Event.new(valid_attributes.merge(capacity: -1))
            expect(event).not_to be_valid
        end

        it 'Is not valid with negative points' do
            event = Event.new(valid_attributes.merge(points: -1))
            expect(event).not_to be_valid
        end
    end
end