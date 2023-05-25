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
class Appointment < ApplicationRecord
  after_update :change_status

  belongs_to :doctor
  belongs_to :patient

  enum :status, { opened: 0, closed: 1}

  validate :open_appointments_count, on: :create
  validate :validate_recommendation, on: :update

  private

  def change_status
    if saved_change_to_attribute?(:recommendation)
      self.closed!
    end
  end

  def open_appointments_count
    if doctor.appointments.opened.count >= 10
      errors.add(:doctor, "You cannot create more than 10 doctor appointments")
    end
  end

  def validate_recommendation
    if recommendation.empty?
      errors.add(:recommendation, "Reccomendation is empty. You must leave some reccomendation")
    end
  end
end
