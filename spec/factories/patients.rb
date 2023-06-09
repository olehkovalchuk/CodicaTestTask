# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           not null
#  phone                  :string           not null
#  role                   :integer          not null
#  type                   :string           default("Patient"), not null
#  category_id            :uuid
#
FactoryBot.define do
  factory :patient do
    name { Faker::Name.name }
    phone { Faker::Base.numerify('+38(0##)###-##-##') }
    password { Faker::Internet.password }
    type { 'Patient' }
    role { 'patient' }
  end
end
