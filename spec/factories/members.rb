FactoryBot.define do
    factory :member do
        first_name { Faker::Name.first_name }
        last_name { Faker::Name.last_name }
        sequence(:email) { |n| "#{Faker::Internet.username(specifier: 5..8)}#{n}@tamu.edu" }
        avatar_url { "https://example.com/image.jpg" }
        points { 100 }
        date_joined { Date.today }
        degree { "Bachelor" }
        food_allergies { "None" }
        position { "Member" }

        after(:create) do |member, evaluator|
        role = Role.find_by(name: member.position)
        MemberRole.create!(member: member, role: role)
        end

        trait :admin do
        position { "Admin" }
        end

        trait :officer do
        position { "Officer" }
        end
    end
end
  