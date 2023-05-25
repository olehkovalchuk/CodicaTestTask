require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  describe "POST /create" do
    let(:doctor) { create(:doctor) }
    
    context "when doctor haven't any appointments yet" do
      it "creates an Appointment and redirects to created appointment" do
        sign_in create(:patient)
  
        expect { post appointments_path, params: { appointment: {doctor_id: doctor.id } } }.to change(Appointment, :count).by(1)   
        expect(response).to redirect_to appointment_path(Appointment.last)
      end
    end
    
    context "when doctor has 10 Appointments yet" do
      let(:patient) { create(:patient) }
      
      before do
        10.times do
          create(:appointment, doctor_id: doctor.id, patient_id: patient.id)
        end
      end

      it "does not create an appointment and redirects to root path" do
        allow_any_instance_of(AppointmentsController).to receive(:current_user).and_return(patient)

        expect { post appointments_path, params: { appointment: {doctor_id: doctor.id } } }.not_to change(Appointment, :count)   
        expect(response).to redirect_to root_path
      end
    end
  end
end
