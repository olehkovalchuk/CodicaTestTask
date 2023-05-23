module DoctorsHelper
  def appointmetn_to_doctor(patient)
    patient.appointments.opened.where(doctor_id: current_user.id).first
  end
end
