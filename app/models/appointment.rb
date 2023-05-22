# == Schema Information
#
# Table name: appointments
#
#  id             :uuid             not null, primary key
#  recommendation :text             default("")
#  status         :integer          default("open"), not null
#  doctor_id      :uuid             not null
#  patient_id     :uuid             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  enum :status, { opened: 0, closed: 1}
end
