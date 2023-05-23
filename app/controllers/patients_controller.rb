class PatientsController < ApplicationController
  load_and_authorize_resource
  def index
    @patients = Patient.joins(:appointments).merge(Appointment.opened.where(doctor_id: params[:doctor_id]))
  end
end
