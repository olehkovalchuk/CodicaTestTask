require 'rails_helper'

RSpec.describe 'update appointment', type: :system do
  let!(:doctor) { create(:doctor, phone: "+38(067)222-22-22", password: "password") }
  let!(:patient) { create(:patient) }
  let!(:appointment) { create(:appointment, doctor_id: doctor.id, patient_id: patient.id) }

  shared_examples 'doctor log in and move to update appointment page' do |valid_data: nil|
    scenario 'doctor movment to leave recommendation' do
      # login as doctor
      visit root_path
      
      fill_in 'Phone', with: '672222222'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'

      expect(page.current_path).to eq(root_path)
      expect(page).to have_content("Doctor Profile")
      expect(page).to have_content("Signed in successfully")

      # move to patient appointments page
      find('#patients_appointments').click

      expect(page.current_path).to eq(doctor_patients_path(doctor))
      expect(page).to have_content("Patients List")
      expect(page).to have_content("#{patient.name}")

      # move to edit appointment page
      find('#leave_recommendation').click

      expect(page.current_path).to eq(edit_appointment_path(appointment))
      expect(page).to have_content("#{patient.name} Appointment")
      expect(page.has_field?('Recommendation'))

      #leave recommendation
      fill_in "appointment_recommendation", with: recommendation
      click_button 'Update and close'

      #leave valid recommendation
      expect(page.current_path).to eq(appointment_path(appointment)) if valid_data
      expect(page).to have_content("Appointment updated") if valid_data
      expect(page).to have_content("#{patient.name} Appointment") if valid_data

      expect(appointment.reload.recommendation).to eq(recommendation) if valid_data
      expect(appointment.status).to eq("closed") if valid_data

      #leave invalid recommendation
      expect(page.current_path).to eq(edit_appointment_path(appointment)) unless valid_data
      expect(page).to have_content("Reccomendation is empty. You must leave some reccomendation") unless valid_data
      expect(appointment.reload.recommendation).to eq('') unless valid_data
      expect(appointment.status).to eq("opened") unless valid_data
    end
  end

  context 'with filled recommendation' do
    let(:recommendation) { 'Doctors Recommendation' }
  
    include_examples 'doctor log in and move to update appointment page', valid_data: true
  end

  context 'with filled recommendation' do
    let(:recommendation) { '' }
  
    include_examples 'doctor log in and move to update appointment page', valid_data: false
  end
end