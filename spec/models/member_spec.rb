require 'rails_helper'

RSpec.describe Member, type: :model do
  # Assuming FactoryBot is set up for 'member'
  subject { build(:member) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a first_name' do
      subject.first_name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a last_name' do
      subject.last_name = nil
      expect(subject).not_to be_valid
    end

    
  end
end

