FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '99999999' }
  end

  trait :with_profile do
    after :build do |user|
      build(:profile, user: user)
    end
  end
end
