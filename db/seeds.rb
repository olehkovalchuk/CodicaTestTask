require 'faker'

TEST_PASSWORD = 'password'
CATEGORIES = %w[cardiologist therapist neurologist]

CATEGORIES.each do |category|
  c = Category.find_or_initialize_by(name: category)
  c.save! if c.new_record?
end

admin = Admin.find_or_initialize_by(phone: '+38(067)111-11-11')
admin.name = 'Admin'
admin.password = TEST_PASSWORD
admin.password_confirmation = TEST_PASSWORD
admin.save!

doctor = Doctor.find_or_initialize_by(phone: '+38(067)222-22-22')
doctor.name = 'Doctor'
doctor.category =  Category.first
doctor.password = TEST_PASSWORD
doctor.password_confirmation = TEST_PASSWORD
doctor.save!

patient = Patient.find_or_initialize_by(phone: '+38(067)333-33-33')
patient.name = 'Patient'
patient.password = TEST_PASSWORD
patient.password_confirmation = TEST_PASSWORD
patient.save!

#create fake doctors
def create_doctors
  Category.all.each do |category|
    break if category.doctors.count >= 2
    2.times do
      doctor = category.doctors.create!(
        phone: Faker::Base.numerify('+38(0##)###-##-##'),
        name:  Faker::Name.name,
        password: Faker::Internet.password
      )
    end
  end
end

# create fake patients
def create_patients
  return if Patient.count >= 10
  10.times do
    Patient.create!(
      phone: Faker::Base.numerify('+38(0##)###-##-##'),
      name:  Faker::Name.name,
      password: Faker::Internet.password
    )
  end
end

# create fake appointments
def create_appointments
  Patient.all.each do |patient|
    break if patient.appointments.count >= 4
    4.times do |i|
      appointment = patient.appointments.create!(doctor: Doctor.all.sample)
      # closed appointments
      if i.odd?
        appointment.recommendation = Faker::Lorem.paragraph(sentence_count: 20)
        # remove after auto closed appointments with recomendations will be implemented
        appointment.closed!
      end
    end
  end
end

create_doctors
create_patients
create_appointments
