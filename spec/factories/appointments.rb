# == Schema Information
#
# Table name: appointments
#
#  id             :uuid             not null, primary key
#  recommendation :text             default("")
#  status         :integer          default("opened"), not null
#  doctor_id      :uuid             not null
#  patient_id     :uuid             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :appointment do
    recommendation { "" }
    status { 0 }
    doctor { nil }
    patient { nil }
  end
end
