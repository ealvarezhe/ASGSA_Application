require 'rails_helper'

RSpec.describe MemberPolicy, type: :policy do
  before do
    Rails.application.load_seed
  end
  
  let(:admin) { create(:member, :admin) }
  let(:member) { create(:member) }
  let(:officer) { create(:member, :officer) }
  let(:other_member) { create(:member) }

  describe 'Scope' do
    subject { Pundit.policy_scope!(user, Member) }

    context 'for an admin' do
      let(:user) { admin }

      it 'includes all members' do
        member # Ensure the member is created
        expect(subject).to include(member)
      end
    end
  end

  describe '#show?' do
    # Admins can see any profile
    it 'allows an admin to see any profile' do
      expect(MemberPolicy.new(admin, other_member).show?).to be_truthy
    end

    # Officers can see any profile
    it 'allows an officer to see any profile' do
      expect(MemberPolicy.new(officer, other_member).show?).to be_truthy
    end

    # Members can see their own profile
    it 'allows a member to see their own profile' do
      expect(MemberPolicy.new(member, member).show?).to be_truthy
    end

    # Members cannot see other members' profiles if they are not an admin or an officer
    it 'denies a member from seeing another member\'s profile' do
      expect(MemberPolicy.new(member, other_member).show?).to be_truthy
    end
  end
end
