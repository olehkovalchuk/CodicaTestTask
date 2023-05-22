ActiveAdmin.register Patient do
  actions :index, :show, :destroy
  config.filters = false

  index do
    selectable_column
    column :name
    column :phone
    column 'open_appointments' do |patient|
      patient.appointments.opened.count
    end
    column 'closed_appointments' do |patient|
      patient.appointments.closed.count
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :phone
      row 'open_appointments' do |patient|
        patient.appointments.opened
      end
      row 'closed_appointments' do |patient|
        patient.appointments.closed
      end
    end
  end
end
