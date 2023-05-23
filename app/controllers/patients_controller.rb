class PatientsController < ApplicationController
  def index
    @patients = Patient.joins(:appointments).merge(Appointment.opened.where(doctor_id: params[:doctor_id]))
  end
end
