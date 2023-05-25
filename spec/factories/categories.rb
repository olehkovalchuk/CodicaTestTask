# == Schema Information
#
# Table name: categories
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :category do
    name { nil }

    trait :therapist do
      name { 'therapist' }
    end

    trait :neurologist do
      name { 'neurologist' }
    end

    trait :cardiologist do
      name { 'cardiologist' }
    end
  end
end
