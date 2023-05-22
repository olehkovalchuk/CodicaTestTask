class AppointmentsController < ApplicationController
  def index
    @appointments = current_user.appointments
  end

  def new
    @appointment = current_user.appointments.new(doctor_id: params[:doctor_id])
    @doctors_list = params[:category_id] ? Doctor.where(category_id: params[:category_id]) : Doctor.all
  end

  def create
    @appointment = current_user.appointments.new(**appointment_params)
    
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointment_path(@appointment), notice: "Appointment successfully created" }
      else
        format.html { redirect_to root_path, alert: @comment.errors.first.type }
      end
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

  def appointment_params
    params.require(:appointment).permit(:id, :doctor_id, :patient_id)
  end
end
